const schema = require('mongoose')

const userSchema = new schema.Schema({
    userName: String,
    email: String,
    password: String,
});
module.exports = userSchema;