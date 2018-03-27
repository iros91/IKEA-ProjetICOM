
%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	extern int yylex();
	int yyerror (char const *message) {
		fputs (message, stderr); fputc ('\n', stderr); return 0;
	}
%}


%start S
%union { int num; char* str; }
%token Rotation eol
%token <num> Quantite
%token <str> Coordonnees
%token <str> Meuble
%left Retrait
%type <str> S
%type <str> E
%type <str> C

%%
S :	
	| S C eol		{printf("Commande détectée\n");} // Stocker les params et les renvoyer en JS
	| S error eol		{yyerrok;}

C :	 C E	
	|E

E :	  Meuble Coordonnees				    {printf("1\n");}
	| Meuble Coordonnees Rotation			{printf("2\n");}
	| Quantite Meuble Coordonnees			{printf("3\n");
	                                            if ($1 > 1){
	                                                max=strlen($2);
	                                                int i;
	                                                int nbVirgules;
	                                                for(i=0;i<max;i++){
                                                     if ($3[i]==","){
                                                        nbVirgules++;
                                                     }
                                                    }
                                                    if (nbVirgules == $1){
                                                         printf("On a %d coordonnees",$1);
                                                    }else{
                                                        printf("Erreur, le nombre de coordonnées est inférieur à la quantité");
                                                    }
                                                    }
	                                            
	                                            
	                                        }
	| Quantite Meuble Coordonnees Rotation		{printf("4\n");
	                                                if ($1 > 1){
	                                                      max=strlen($3);
	                                                      int i;
	                                                      int nbVirgules;
	                                                      for(i=0;i<max;i++){
                                                            if ($3[i]==","){
                                                            nbVirgules++;
                                                            }
                                                          }
                                                          if (nbVirgules == $1){
                                                            printf("On a %d coordonnees",$1);
                                                          }else{
                                                            printf("Erreur, le nombre de coordonnées est inférieur à la quantité");
                                                          }
                                                          }
	                                            }
	                                            
	| Retrait Coordonnees			 	{printf("5\n");};
	
%%


int main(void) 
{
	return yyparse(); 
}
