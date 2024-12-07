const express = require('express');
const path = require('path');

const app = express();

// Serve static files from the React app
app.use(express.static(path.join(__dirname, '../frontend/build')));

// API routes
app.get('/api', (req, res) => {
    res.json({ message: 'API is working!' });
});

// Catch-all to serve React's index.html
app.get('*', (req, res) => {
    res.sendFile(path.join(__dirname, '../frontend/build/index.html'));
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
