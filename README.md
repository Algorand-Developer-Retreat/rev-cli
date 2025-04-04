# Rev CLI Tool

A command-line interface tool for interacting with the Rev API. This tool allows you to fetch contract information, manage projects, and perform various contract-related operations directly from your terminal.

## Installation

Clone this repository and ensure you have Ruby installed:

```bash
git clone https://github.com/loedn/rev-cli.git
cd rev-cli
chmod +x cli.rb
```

### Dependencies

This tool requires the following Ruby gems:
- thor
- json
- net/http

Install dependencies with:

```bash
gem install thor
```

## Usage

The CLI tool provides several commands to interact with the Contract API.

### Hello Command

A simple greeting command to test the CLI:

```bash
./cli.rb hello NAME
```

Example:
```bash
./cli.rb hello World
# Output: Hello, World!
```

### Install Command

Fetch and install a specific contract by its ID:

```bash
./cli.rb install CONTRACT_ID
```

Example:
```bash
./cli.rb install 1123
```

### Project Command

Fetch contracts related to projects:

1. Fetch contracts for a specific project:
```bash
./cli.rb project PROJECT_ID
```

2. Fetch all projects:
```bash
./cli.rb project
```

## API Endpoints

The CLI tool interacts with the following API endpoints:

- `http://localhost:3000/api/v1/contracts/{contract_id}` - Get a specific contract
- `http://localhost:3000/api/v1/contracts/project/{project_id}` - Get contracts for a specific project
- `http://localhost:3000/api/v1/projects` - Get all projects

## Contributing

Contributions are welcome! Here's how you can contribute to this project:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature-name`)
3. Make your changes
4. Run tests if available
5. Commit your changes (`git commit -m 'Add some feature'`)
6. Push to the branch (`git push origin feature/your-feature-name`)
7. Open a Pull Request

### Adding New Commands

To add a new command, extend the `CLI` class in `cli.rb`:

```ruby
desc "command_name [ARGS]", "description of the command"
def command_name(args)
  # Command implementation
end
```

### Coding Standards

- Follow Ruby style guidelines
- Add appropriate documentation for new features
- Include error handling for robustness

## License

MIT License

Copyright (c) 2023 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

