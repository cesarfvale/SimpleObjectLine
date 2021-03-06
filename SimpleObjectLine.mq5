void OnTick()
  {
   // Crie uma variável para a vela mais alta
   int HighestCandle;
   
   // Crie um matriz para a vela mais alta
   double High[];
   
   // Ordenar matriz abaixo da vela atual
   ArraySetAsSeries(High,true);
   
   // Preencha matriz com dados para 12 velas
   CopyHigh(_Symbol,_Period,0,12,High);
   
   // Calcular a vela mais alta
   HighestCandle = ArrayMaximum(High,0,12);
   
   // Criar uma matriz para preços
   MqlRates PriceInformation[];
   
   // Classifique-o da vela atual para a vela mais antiga
   ArraySetAsSeries(PriceInformation,true);
   
   // Copiar dados de preço para o array
   int Data=CopyRates(Symbol(),Period(),0,Bars(Symbol(),Period()),PriceInformation);
   
   // Definir propriedades de objeto para uma linha
   ObjectCreate(_Symbol,"Line1", OBJ_HLINE,0,0,PriceInformation[HighestCandle].high);
   
   // Definir cor do objeto
   ObjectSetInteger(0,"Line1",OBJPROP_COLOR,clrRed);
   
   // Definir largura do objeto
   ObjectSetInteger(0,"Line1",OBJPROP_WIDTH,3);
   
   // Mova a linha
   ObjectMove(_Symbol,"Line1",0,0,PriceInformation[HighestCandle].high);
   
  }