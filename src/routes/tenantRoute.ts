import {Router} from 'express'
import { createTenant } from '../controllers/tenant.controller'

const tenantRouter = Router()

// Routes
tenantRouter.get('/', (req, res) => {
  res.send('Hello from tenant route')
})

tenantRouter.post('/register',createTenant)



export default tenantRouter