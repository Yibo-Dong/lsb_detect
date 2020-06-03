%option noyywrap yylineno
%option outfile="flex.c"
%{
	#include <stdio.h>
	#include <stdlib.h>	
	#include "func.h"
	#include "func.c"
	#define bufsize 1000000
//	struct ast* head = malloc(sizeof(struct ast*));
        struct ast *p;

%}

%%

"32" {
      append(32,p);
      p = p->next;
}


"33" {
      append(33,p);
      p = p->next;
}

"44" {
      append(44,p);
      p = p->next;
}

"46" {
      append(46,p);
      p = p->next;
}
	
"48" {
      append(48,p);
      p = p->next;
     }

"49" {
      append(49,p);
      p = p->next;
     }

"50" {
      append(50,p);
      p = p->next;
     }

"51" {
      append(51,p);
      p = p->next;
     }

"52" {
      append(52,p);
      p = p->next;
     }

"53" {
      append(53,p);
      p = p->next;
     }

"54" {
      append(54,p);
      p = p->next;
     }

"55" {
      append(55,p);
      p = p->next;
     }

"56" {
      append(56,p);
      p = p->next;
     }

"57" {
      append(57,p);
      p = p->next;
     }

"65" {
      append(65,p);
      p = p->next;
     }

"66" {
      append(66,p);
      p = p->next;
     }

"67" {
      append(67,p);
      p = p->next;
     }

"68" {
      append(68,p);
      p = p->next;
     }

"69" {
      append(69,p);
      p = p->next;
     }

"70" {
      append(70,p);
      p = p->next;
     }

"71" {
      append(71,p);
      p = p->next;
     }

"72" {
      append(72,p);
      p = p->next;
     }

"73" {
      append(73,p);
      p = p->next;
     }

"74" {
      append(74,p);
      p = p->next;
     }

"75" {
      append(75,p);
      p = p->next;
     }

"76" {
      append(76,p);
      p = p->next;
     }

"77" {
      append(77,p);
      p = p->next;
     }

"78" {
      append(78,p);
      p = p->next;
     }

"79" {
      append(79,p);
      p = p->next;
     }

"80" {
      append(80,p);
      p = p->next;
     }

"81" {
      append(81,p);
      p = p->next;
     }

"82" {
      append(82,p);
      p = p->next;
     }

"83" {
      append(83,p);
      p = p->next;
     }

"84" {
      append(84,p);
      p = p->next;
     }

"85" {
      append(85,p);
      p = p->next;
     }

"86" {
      append(86,p);
      p = p->next;
     }

"87" {
      append(87,p);
      p = p->next;
     }

"88" {
      append(88,p);
      p = p->next;
     }

"89" {
      append(89,p);
      p = p->next;
     }

"90" {
      append(90,p);
      p = p->next;
     }

"97" {
      append(97,p);
      p = p->next;
     }

"98" {
      append(98,p);
      p = p->next;
     }

"99" {
      append(99,p);
      p = p->next;
     }

"100" {
      append(100,p);
      p = p->next;
     }

"101" {
      append(101,p);
      p = p->next;
     }

"102" {
      append(102,p);
      p = p->next;
     }

"103" {
      append(103,p);
      p = p->next;
     }

"104" {
      append(104,p);
      p = p->next;
     }

"105" {
      append(105,p);
      p = p->next;
     }

"106" {
      append(106,p);
      p = p->next;
     }

"107" {
      append(107,p);
      p = p->next;
     }

"108" {
      append(108,p);
      p = p->next;
     }

"109" {
      append(109,p);
      p = p->next;
     }

"110" {
      append(110,p);
      p = p->next;
     }

"111" {
      append(111,p);
      p = p->next;
     }

"112" {
      append(112,p);
      p = p->next;
     }

"113" {
      append(113,p);
      p = p->next;
     }

"114" {
      append(114,p);
      p = p->next;
     }

"115" {
      append(115,p);
      p = p->next;
     }

"116" {
      append(116,p);
      p = p->next;
     }

"117" {
      append(117,p);
      p = p->next;
     }

"118" {
      append(118,p);
      p = p->next;
     }

"119" {
      append(119,p);
      p = p->next;
     }

"120" {
      append(120,p);
      p = p->next;
     }

"121" {
      append(121,p);
      p = p->next;
     }

"122" {
      append(122,p);
      p = p->next;
     }

.	{}

%%

int function(char s[],FILE *towrite)
{

	
	printf("%s","Lexer start working\n");

	//char s[80] = "input.txt";
	if((yyin = fopen(s,"r"))==NULL)
	{
		printf("File %s cannot be opened.\n",s);
	}

	struct ast* head = malloc(sizeof(struct ast*));
	p = head;
		
	yylex();
	
	while(head->next)
	{
	head = head->next;
	int n = head->value;
	if(n==32)
	fprintf(towrite,"%c"," ");
	if(n==33)
        fprintf(towrite,"%c","!");
	if(n==44)
        fprintf(towrite,"%c",",");
	if(n==46)
        fprintf(towrite,"%c",".");
	if(48<=n && n<=57 )
	fprintf(towrite,"%d",head->value-48 );
	else if(65<=n && n<=90)
	fprintf(towrite,"%c",head->value - 65 + 'A');
	else if(97<=n && n<=122)
	fprintf(towrite,"%c",head->value - 97 + 'a');
	else break;
	}


	printf("%s","Lexer completed.\n");
	return 0;
}

void translation(FILE *in,FILE *out)
{
	int flag = 1;
	int a[8],b,c;
	while(flag)
	{	
		int i=7;
		for( i= 7 ; i >= 0 ; i--)
		{
			if ((b = fgetc(in)) != EOF)
			  a[i] = (b-'0'); 
			else flag=0;
		}
		c = a[0] + 2*a[1] + 4*a[2] + 8*a[3]
		+16*a[4] + 32*a[5]+64*a[6] + 128*a[7];
		//printf("%d",c);                		   
                if(c>100)
			{
			int tmp = c/100;
			fputc(tmp+'0',out);
			 c=c%100;
			}
		if(c>10)
                        {
                        int tmp = c/10;
                        fputc(tmp+'0',out);
                         c=c%10;
                        }
		fputc(c+'0',out);
		fputc(' ',out);
	}
	printf("translation finished.\n");
	
}




int main()
{
	FILE *binary = fopen("binary.txt","r");
	//the input source file
        	FILE *string = fopen("string.txt","w");
	
	FILE *towrite = fopen("trivial.txt","w");
	translation(binary,string);

	function("string.txt",towrite);
	fclose(string);
	fclose(towrite);
	fclose(binary);
	return 0;
}


