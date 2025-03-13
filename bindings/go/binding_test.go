package tree_sitter_scenery_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_scenery "github.com/pandaloop0/tree-sitter-scenery/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_scenery.Language())
	if language == nil {
		t.Errorf("Error loading Scenery grammar")
	}
}
