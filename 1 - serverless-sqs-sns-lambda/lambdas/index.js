const got = require('got');

exports.handler=async(event,context)=>{
    console.log("Received event",event);
    console.log("Context",context);

    try {
        const response = await got("https://aws.random.cat/meow")

        return {
            status:200,
            body: JSON.stringify(response.body)
        }
    } catch (error) {
        console.log(error);
        throw new Error(error)
    }
}