
import { Request, Response, NextFunction } from 'express';


interface Error {
  status?: number;
  message?: string;
  stack?: string;
}

const errorHandler = (err: Error, req: Request, res: Response, next: NextFunction) => {
  console.error(err.stack);
  res.status(err.status || 500).json(err.message || 'Something went wrong');
};

export default errorHandler;