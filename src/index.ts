import express from 'express'

// imports
import errorHandler from './middleware/errorHandler'
// Routers imports 
import tenantRouter from './routes/tenantRoute'

const app = express()

// Routers
app.use('/tenant', tenantRouter)



app.use(errorHandler)
const PORT: number = 3000


app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`)
})