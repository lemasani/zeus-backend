import {Router} from 'express'

const tenantRouter = Router()

// Routes
tenantRouter.get('/', (req, res) => {
  res.send('Hello from tenant route')
})



export default tenantRouter