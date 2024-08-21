# Testing

## How to test

### Unit Testing
- go test: The built-in testing package in Go.
    Example: Writing test functions with names starting with Test and using go
    test to run them.
    Usage: go test ./...
- Testify: A popular third-party library that extends the functionality of go
test.
    Example: Using assert and require packages for more expressive tests.
    Usage: go get github.com/stretchr/testify

-  Methods:
    - Use a mock database:
        - Benefits of Using a Mock Database
            Avoid API Rate Limits: Mock databases allow you to test without
            hitting API rate limits.
            Consistent Test Results: Mock data ensures that tests are deterministic
            and not affected by external factors.
            Faster Test Execution: Mock databases can be faster than making
            network calls to real APIs.
            Isolation: Tests are isolated from external dependencies, making
            them more reliable.

        - Tools and Libraries for Mocking in Golang
            - go-sqlmock: A mocking library for Go's database/sql package.
                - Usage: Useful for mocking SQL databases in your tests.
                - Example: 
            ```
                import (
                    "github.com/DATA-DOG/go-sqlmock"
                    "database/sql"
                    _ "github.com/lib/pq"
                )

                func TestSomething(t *testing.T) {
                    db, mock, err := sqlmock.New()
                    if err != nil {
                        t.Fatalf("an error '%s' was not expected whenopening a stub database connection", err)
                    }
                    defer db.Close()

                    rows := sqlmock.NewRows([]string{"id", "name"}).
                        AddRow(1, "John").
                        AddRow(2, "Jane")

                    mock.ExpectQuery("SELECT id, name FROM users").WillReturnRows(rows)

                    // Use db for your tests
                }
            ```

            - testify/mock: A mocking package for Go that can be used to create
            mock objects for any interface.
                - Usage: Useful for mocking database interfaces or other dependencies.
                - Example:
            ```
                import (
                    "github.com/stretchr/testify/mock"
                )

                type MyDatabaseInterface interface {
                    GetUser(id int) (User, error)
                }

                type MockDatabase struct {
                    mock.Mock
                }

                func (m *MockDatabase) GetUser(id int) (User, error) {
                    args := m.Called(id)
                    return args.Get(0).(User), args.Error(1)
                }

                func TestGetUser(t *testing.T) {
                    mockDB := new(MockDatabase)
                    mockDB.On("GetUser", 1).Return(User{ID: 1, Name: "John"}, nil)

                    user, err := mockDB.GetUser(1)
                    if err != nil {
                        t.Errorf("Expected no error, got %v", err)
                    }
                    if user.Name != "John" {
                        t.Errorf("Expected user name to be John, got %s", user.Name)
                    }
                }
            ```

            - httptest: A package in the Go standard library for creating
            mock HTTP servers.
                - Usage: Useful for mocking HTTP endpoints in your tests.
                - Example:
            ```
            import (
                "net/http"
                "net/http/httptest"
                "testing"
            )

            func TestHandler(t *testing.T) {
                req, err := http.NewRequest("GET", "/test", nil)
                if err != nil {
                    t.Fatal(err)
                }

                rr := httptest.NewRecorder()
                handler := http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
                    w.Write([]byte("Hello, world!"))
                })

                handler.ServeHTTP(rr, req)

                if status := rr.Code; status != http.StatusOK {
                    t.Errorf("handler returned wrong status code: got %v want %v",
                        status, http.StatusOK)
                }

                expected := "Hello, world!"
                if rr.Body.String() != expected {
                    t.Errorf("handler returned unexpected body: got %v want %v",
                        rr.Body.String(), expected)
                }
            }
            ```

### Integration Testing
- go test: Can also be used for integration tests by setting up the necessary
environment.
    Example: Writing tests that interact with databases, external APIs, etc.
    Usage: go test -tags=integration ./...
- Ginkgo: A BDD-style testing framework.
    Example: Writing tests in a more readable, behavior-driven style.
    Usage: go get github.com/onsi/ginkgo/ginkgo
### Functional Testing
- go test: Can be used for functional testing by writing tests that cover
the entire functionality of the application.
    Example: Testing end-to-end scenarios.
    Usage: go test ./...
- Gomega: A matcher/assertion library that works well with Ginkgo.
    Example: Using matchers to write more expressive tests.
    Usage: go get github.com/onsi/gomega
### Performance Testing
- go benchmark: The built-in benchmarking tool in Go.
    Example: Writing benchmark functions with names starting with Benchmark.
    Usage: go test -bench=. ./...
- Vegeta: A versatile HTTP load testing tool.
    Example: Testing the performance of your HTTP endpoints.
    Usage: go get github.com/tsenart/vegeta
### Security Testing
- go-sec: A static analysis tool for Go that checks for security issues.
    Example: Scanning your code for common security vulnerabilities.
    Usage: go get github.com/securego/gosec/cmd/gosec
### Usability Testing
- Manual Testing: For usability testing, manual testing is often the best
approach.
    Example: Having users interact with the application and provide feedback.
    Tools: Tools like UsabilityHub or UserTesting can be used for gathering
    user feedback.
### Compatibility Testing
- Docker: Using Docker to create containers for different environments.
    Example: Testing your application in different operating systems and configurations.
    Usage: docker run -it your-image
### Smoke and Sanity Testing
- go test: Can be used for quick smoke and sanity tests.
    Example: Writing simple tests to ensure basic functionality.
    Usage: go test ./...
### Exploratory Testing
- Manual Testing: Exploratory testing is typically done manually.
    Example: Testers manually explore the application to find defects.
    Tools: Mind mapping tools like XMind can be used to document findings.
### Continuous Integration (CI) Tools
- GitHub Actions: Automate your testing workflows.
    Example: Running tests on every push or pull request.
    Usage: Define workflows in .github/workflows directory.
- GitLab CI: Similar to GitHub Actions, but for GitLab.
    Example: Running tests on every commit.
    Usage: Define pipelines in .gitlab-ci.yml.

## Articles

- [Go’s Error Handling Is Perfect, Actually](https://blog.verygoodsoftwarenotvirus.ru/posts/errors-in-go/)