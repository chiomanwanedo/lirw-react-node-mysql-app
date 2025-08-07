/* eslint-disable @typescript-eslint/no-explicit-any */
import { Button, Select } from 'antd';
import './App.css';
import { Link } from 'react-router-dom';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
  ArcElement,
} from 'chart.js';
import { Bar, Pie } from 'react-chartjs-2';
import { useEffect, useState } from 'react';
import { Book } from './models/Books';

const { Option } = Select;
const API_URL = import.meta.env.VITE_API_URL;

ChartJS.register(
  ArcElement,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

const barChartOptions = {
  responsive: true,
  plugins: {
    legend: {
      position: 'top' as const,
    },
    title: {
      display: true,
      text: 'Book Length Distribution',
    },
  },
  scales: {
    y: {
      min: 150,
      max: 700,
      ticks: {
        stepSize: 10,
      },
    },
    x: {
      ticks: {
        callback: function (val: string | number) {
          const label = String(val);
          return label.length > 10 ? label.slice(0, 10) + '...' : label;
        },
      },
    },
  },
};

function App() {
  const [books, setBooks] = useState<Book[]>([]);
  const [booksBarChartData, setBooksBarChartData] = useState<any>();
  const [pieChartData, setPieChartData] = useState<any>();
  const [showAll, setShowAll] = useState(false);
  const [selectedAuthor, setSelectedAuthor] = useState<string | null>(null);

  useEffect(() => {
    fetchBooks();
  }, []);

  useEffect(() => {
    let filtered = [...books];

    if (selectedAuthor) {
      filtered = filtered.filter((book) => book.name === selectedAuthor);
    }

    const sortedBooks = [...filtered].sort((a, b) => b.pages - a.pages);
    const displayedBooks = showAll ? sortedBooks : sortedBooks.slice(0, 10);

    const labels = displayedBooks.map((book) => book.title);
    const data = displayedBooks.map((book) => book.pages);

    setBooksBarChartData({
      labels,
      datasets: [
        {
          label: 'Total Pages',
          data,
          backgroundColor: generateColors(data.length),
          borderColor: generateColors(data.length),
          borderWidth: 1,
        },
      ],
    });
  }, [books, showAll, selectedAuthor]);

  useEffect(() => {
    const authorBookCount = new Map<string, number>();

    for (const book of books) {
      authorBookCount.set(book.name, (authorBookCount.get(book.name) || 0) + 1);
    }

    const sorted = Array.from(authorBookCount.entries()).sort((a, b) => b[1] - a[1]);
    const top10 = sorted.slice(0, 10);
    const othersCount = sorted.slice(10).reduce((sum, [, count]) => sum + count, 0);

    const labels = top10.map(([name]) => name);
    const values = top10.map(([, count]) => count);

    if (othersCount > 0) {
      labels.push('Others');
      values.push(othersCount);
    }

    setPieChartData({
      labels,
      datasets: [
        {
          label: 'Book Count',
          data: values,
          backgroundColor: generateColors(labels.length),
          borderColor: generateColors(labels.length),
          borderWidth: 1,
        },
      ],
    });
  }, [books]);

  const fetchBooks = async () => {
    try {
      const response = await fetch(`${API_URL}/books`);
      const { books, message } = await response.json();

      if (!response.ok) {
        throw new Error(message);
      }

      setBooks(books);
    } catch (error) {
      console.log(error);
    }
  };

  function generateColors(numColors: number) {
    const colors = [];
    const colorPalette = [
      '#ff6384',
      '#36a2eb',
      '#cc65fe',
      '#ffce56',
      '#4caf50',
      '#ff9f40',
      '#8e44ad',
      '#2ecc71',
      '#f1c40f',
      '#3498db',
    ];
    for (let i = 0; i < numColors; i++) {
      colors.push(colorPalette[i % colorPalette.length]);
    }
    return colors;
  }

  return (
    <div className='h-screen font-mono p-4'>
      <header className='py-2 border-b'>
        <h1 className='text-center font-bold text-5xl'>Dashboard</h1>
      </header>
      <main className='py-4 px-4 space-y-6'>
        <div className='space-x-4'>
          <Button type='primary' size='large' className='rounded-none'>
            <Link to={`books`}>Books</Link>
          </Button>
          <Button type='primary' size='large' className='rounded-none'>
            <Link to={`authors`}>Authors</Link>
          </Button>
          <Button
            size='large'
            type='default'
            className='rounded-none'
            onClick={() => setShowAll(!showAll)}
          >
            {showAll ? 'Show Top 10 Books' : 'Show All Books'}
          </Button>
        </div>

        <div className='flex flex-wrap gap-4'>
          <Select
            allowClear
            placeholder='Filter by Author'
            style={{ width: 200 }}
            onChange={(value) => setSelectedAuthor(value)}
          >
            {[...new Set(books.map((b) => b.name))].map((author) => (
              <Option key={author} value={author}>
                {author}
              </Option>
            ))}
          </Select>
        </div>

        <div className='flex flex-col lg:flex-row justify-between items-start gap-10 p-4'>
          <div className='w-full lg:w-1/3'>
            {pieChartData && <Pie data={pieChartData} />}
          </div>

          <div
            className='w-full lg:w-2/3 overflow-x-auto'
            style={{ maxWidth: '100%' }}
          >
            {booksBarChartData && (
              <Bar
                height={500}
                options={barChartOptions}
                data={booksBarChartData}
              />
            )}
          </div>
        </div>
      </main>
    </div>
  );
}

export default App;
