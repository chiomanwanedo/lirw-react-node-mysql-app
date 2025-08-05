const app = require('./app'); // This assumes app.js handles Express, routes, DB

const PORT = process.env.PORT || 3200;

app.listen(PORT, '0.0.0.0', () => {
  console.log(`✅ Server is running on http://0.0.0.0:${PORT}`);
});
