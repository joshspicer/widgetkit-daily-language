
const fs = require('fs')

function mapFunc(item) {
    const emoji = item['emoji'];
    const word = item['name'];
    return `Word(native: "${word}", foreign: "${emoji}"),`;
}

fs.readFile('flags.json', (err, data) => {
    if (err) throw err;

    const parsed = JSON.parse(data);
    const output = parsed.map(mapFunc).join('\n');
    process.stdout.write(output); 
        
})
