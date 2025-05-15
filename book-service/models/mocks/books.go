package mocks

import (
	"database/sql"
	"github.com/daulet-omarov/book-service/models"
	"time"
)

var mockBook = &models.Book{
	ID:        1,
	Title:     "An old silent pond",
	Author:    "Author",
	Price:     1000,
	Stock:     10,
	ISBN:      "isbn",
	Image:     "image",
	CreatedAt: time.Now(),
}

type BookModel struct{}

func (m BookModel) Insert(book *models.Book) error {
	return nil
}

func (m BookModel) Get(id int64) (*models.Book, error) {
	switch id {
	case 1:
		return mockBook, nil
	default:
		return nil, sql.ErrNoRows
	}
}

func (m BookModel) Update(book *models.Book) error {
	return nil
}

func (m BookModel) Delete(id int64) error {
	return nil
}

func (m BookModel) GetAll() ([]*models.Book, error) {
	return []*models.Book{mockBook}, nil
}
