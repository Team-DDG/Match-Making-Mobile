const functions = require('firebase-functions');

exports.helloWorld = functions.https.onRequest((req, res) => {
    functions.logger.info('Hello logs!', {structuredData: true});
    response.send('Hello from Firebase!');
});

exports.authPhone = functions.https.onRequest((req, res) => {
    const code = req.query.code;

    if (code !== '1234') {
        res.sendStatus(401);
    }

    res.sendStatus(200);
});