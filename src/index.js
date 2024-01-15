import express from 'express'
import categoriesRoutes from './routes/categories.routes.js'
import notesRoutes from './routes/notes.routes.js'
import cors from 'cors'

const app = express()

app.use(express.json())
app.use(cors())

app.use('/api', notesRoutes)
app.use('/api', categoriesRoutes)

app.listen(3000)
console.log('Listening port', 3000)
