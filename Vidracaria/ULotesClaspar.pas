unit ULotesClaspar;

interface

uses SysUtils, Dialogs;

  Type
    TFLotesClaspar = Class
    Public
      Procedure EmiteLotesClaspar;
  End;

Var
  FLotesClaspar : TFLotesClaspar;

implementation

uses UNotaSaida_Cl,UNotaSaidaParam,UOracle_Cl, URelatorioVenda_cl;

procedure TFLotesClaspar.EmiteLotesClaspar;
Var wDesdobramento : Integer;
begin
  wDesdobramento := StrToInt(Trim(FNotaSaidaParam.ME22Desdobramento.Text));
  with DMNotaSaida do
  begin
    //QDesdobramento_Claspar.Open;
    DMRelatorio_Venda.QRLotesClaspar.First;
    while not(DMRelatorio_Venda.QRLotesClaspar.EOF) do
    begin
      // inclusao do numero do desdobramento lote claspar
      If wDesdobramento > 0 Then
      Begin
       // QDesdobramento_Claspar.Insert;
       // QDesdobramento_ClasparCod_Nota_Item.Value := DMRelatorio_Venda.QRLotesClasparCod_Nota_Item.Value;
       // QDesdobramento_ClasparNum_Desdobramento.Value := wDesdobramento;
       // QDesdobramento_Claspar.Post;
        wDesdobramento := wDesdobramento + 1;
      End;
      DMRelatorio_Venda.QRLotesClaspar.Next;
    end;
    //QDesdobramento_Claspar.Close;
  end;
end;

end.