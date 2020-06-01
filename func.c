#include <stdio.h>
#include <stdlib.h>

struct ast *append (int value,struct ast *before)
{
	struct ast *node =malloc (sizeof(struct ast*));
	if(!node)
	{
		printf("out of space!");
		return NULL;
	}

	node->value = value;
	before->next = node;
	return node;
}

