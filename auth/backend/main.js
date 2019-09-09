var express = require('express')
var app = express()
const config = require('./config')
var jwt = require('jsonwebtoken')


// TODO: wrong json syntax check
app.use(express.json());



// 400: Bad Request, body parameter error
// 401: Unauthorized, credential invalid
// 403: Forbidden, already login, but access area is not allowed
app.post('/api/user/login', (req, res) => {


    const mockedUsername = 'spongebob'
    const mockedPassword = '123'

    const data = {
        username: mockedUsername,
        fullname: 'SpongeBob Squarepants',
        height: '4',
        width: '2'
    }

    const username = req.body.username,
          password = req.body.password

    // parameter check
    if (username && password) {
        // fake authenticaion check
        const success = username === mockedUsername && 
                        password === mockedPassword

        if (success) {
            const token = jwt.sign(data, config.secret)
            res.json({ success: true, token: token })
        }
        else {
            res.status(401)
            res.json({ success: false, message: 'Wrong username or password' })

        }
    }else{
        res.status(400)
        res.json({success: false, message: 'Wrong parameter'})
    }
})



app.get('/api/user', (req, res) => {
    // get token from client
    token = req.headers.authorization;
    
    if(token){
        jwt.verify(token, config.secret,(error, decoded)=>{
            if(error){
                res.status(401)
                res.json({success: false, message: 'Unable to resolve token'})
            }else{
                res.json({success: true, user: decoded})
            }
        })
    }else{
        res.status(401)
        res.json({success: false, message: 'Auth token is not provided'})
    }

})


app.listen(8000, () => { })