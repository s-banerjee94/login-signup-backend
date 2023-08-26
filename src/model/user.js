const mongoose = require('mongoose')


const userSchema = new mongoose.Schema({
    userName: {
        type: String,
        required: true,
        unique: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    },
    password: String,
});

const userSchemaModule = new mongoose.model('users', userSchema)
module.exports = userSchemaModule;

