import express from 'express'

// Routers imports 
import tenantRouter from './routes/tenantRoute'

const app = express()

// Routers
app.use('/tenant', tenantRouter)


const PORT: number = 3000


app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`)
})