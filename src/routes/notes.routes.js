import { Router } from 'express'
import { prisma } from '../db.js'

const router = Router()
router.get('/notes', async (req, res) => {
    const notes = await prisma.note.findMany()
    res.json(notes)
})

router.get('/notes/:id', async (req, res) => {
    const noteFound = await prisma.note.findFirst({
        where: {
            id: parseInt(req.params.id)
        },
        include: {
            category: true
        }
    })

    if (!noteFound) return res.status(404).json({ error: 'Note not found' })
    res.json(noteFound)
})
router.post('/notes', async (req, res) => {
    const newnNote = await prisma.note.create({
        data: req.body
    })
    res.json(newnNote)
})

router.delete('/notes/:id', async (req, res) => {
    const noteDeleted = await prisma.note.delete({
        where: {
            id: parseInt(req.params.id)
        }
    })

    if (!noteDeleted) return res.status(404).json({ error: 'Note not found' })
    res.json(noteDeleted)
})

router.put('/notes/:id', async (req, res) => {
    const noteUpdate = await prisma.note.update({
        where: {
            id: parseInt(req.params.id)
        },
        data: req.body
    })

    res.json(noteUpdate)
})
export default router
