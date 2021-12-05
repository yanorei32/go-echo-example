package cmd_test

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/yanorei32/go-echo-example/cmd"

	"github.com/labstack/echo/v4"
	"github.com/stretchr/testify/assert"
)

func TestGetIndex(t *testing.T) {
	e := echo.New()

	cmd.AttachRouters(e)

	req := httptest.NewRequest(http.MethodGet, "/", nil)
	rec := httptest.NewRecorder()

	e.ServeHTTP(rec, req)

	assert.Equal(t, http.StatusOK, rec.Code)
	assert.Equal(t, "Hello, World!", rec.Body.String())
}
