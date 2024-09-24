import express from 'express';
import bodyParser from 'body-parser';

// imports
import errorHandler from './middleware/errorHandler';
// Routers imports 
import tenantRouter from './routes/tenantRoute';

const app = express();

// Use body-parser middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

// Routers
app.use('/tenant', tenantRouter);

app.use(errorHandler);
const PORT: number = 3000;

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});