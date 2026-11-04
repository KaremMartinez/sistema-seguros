const db = require('../config/db');

// Registrar cliente (HU-001)
exports.registrarCliente = (req, res) => {
    const { nombre, apellido, email, telefono } = req.body;

    // Validación de campos obligatorios vacíos (Criterio 3)[cite: 1]
    if (!nombre || !apellido || !email || !telefono) {
        return res.status(400).json({ status: 'error', message: 'Complete los campos obligatorios.' });
    }

    const query = 'INSERT INTO Cliente (nombre, apellido, email, telefono) VALUES (?, ?, ?, ?)';
    
    db.query(query, [nombre, apellido, email, telefono], (err, result) => {
        if (err) {
            // Validación de email duplicado (Criterio 2)[cite: 1]
            if (err.code === 'ER_DUP_ENTRY') {
                return res.status(400).json({ status: 'error', message: 'El email ya está registrado' });
            }
            return res.status(500).json({ status: 'error', message: err.message });
        }
        // Registro exitoso (Criterio 1)[cite: 1]
        res.status(201).json({ status: 'success', message: 'Cliente registrado correctamente' });
    });
};