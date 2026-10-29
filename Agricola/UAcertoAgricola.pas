unit UAcertoAgricola;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, Grids, DBGrids, Db, variants;

type
  TFAcertoAgricola = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    MeFilial: TMaskEdit;
    MeProduto: TMaskEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    MeLote: TMaskEdit;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    MeDtInicial: TMaskEdit;
    MeDtFinal: TMaskEdit;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAcertoAgricola: TFAcertoAgricola;

implementation

uses URomaneioAgricola_cl, UOracle_cl, UNotaEntrada_cl, URValorSaldoFixar;

{$R *.DFM}

procedure TFAcertoAgricola.BitBtn1Click(Sender: TObject);
begin
  With DMRomaneioAgricola do
   Begin
     QAcertoFixar.Close;
     QAcertoFixar.SetVariable('Produto',StrToInt(Trim(MeProduto.Text)));
     QAcertoFixar.SetVariable('Filial',StrToInt(Trim(MeFilial.Text)));
     QAcertoFixar.SetVariable('Lote_Tipo',StrToInt(Trim(MeLote.Text)));
     QAcertoFixar.Open;
   End;
end;

procedure TFAcertoAgricola.BitBtn2Click(Sender: TObject);
Var wQtde_Fixado,wQtde_Fixar : Real;
begin
  DMOracle.ValidaFilial(MeFilial.Text);
  With DMRomaneioAgricola Do
  Begin
     DMOracle.DBCemapa.StartTransaction;
     Try
       QAcertoFixar.First;
       DMNotaEntrada.QSaldoFixado.Close;
       DMNotaEntrada.QSaldoFixado.SetVariable('COD_NOTA_ITEM',QAcertoFixarCod_Nota_Item.Value);
       DMNotaEntrada.QSaldoFixado.Open;
       While Not QAcertoFixar.Eof do
        Begin
          wQtde_Fixado := 0;
          DMNotaEntrada.QNotaFixar.Close;
          DMNotaEntrada.QNotaFixar.SetVariable('CADASTRO',QAcertoFixarCod_Cadastro.Value);
          DMNotaEntrada.QNotaFixar.SetVariable('PRODUTO',StrToInt(Trim(MeProduto.Text)));
          DMNotaEntrada.QNotaFixar.SetVariable('FILIAL',StrToInt(Trim(MeFilial.Text)));
          DMNotaEntrada.QNotaFixar.SetVariable('DATAI',Null);
          DMNotaEntrada.QNotaFixar.SetVariable('DATAF',DMOracle.DataServ);
          DMNotaEntrada.QNotaFixar.SetVariable('TIPO_FIXAR','EMPRESA');
          DMNotaEntrada.QNotaFixar.Open;
          While (wQtde_Fixado < QAcertoFixarQt_Quantidade.Value) and
               not (DMNotaEntrada.QNotaFixar.Eof) do
          Begin
            wQtde_Fixar :=  DMNotaEntrada.QNotaFixarSQtde_Fixar.Value-DMNotaEntrada.QNotaFixarSQtde_Fixado.Value;
            If wQtde_Fixar > (QAcertoFixarQt_Quantidade.Value - wQtde_Fixado) then
              wQtde_Fixar := QAcertoFixarQt_Quantidade.Value - wQtde_Fixado;
            If wQtde_Fixar > 0 then
            Begin
              DMNotaEntrada.QSaldoFixado.Insert;
              DMNotaEntrada.QSaldoFixadoCod_NF_Item_Fixar.Value := Trunc(DMNotaEntrada.QNotaFixarCod_Nota_Item.Value);
              DMNotaEntrada.QSaldoFixadoCod_NF_Item_Fixado.Value := QAcertoFixarCod_Nota_Item.Value;
              DMNotaEntrada.QSaldoFixadoQt_Fixado.Value := wQtde_Fixar;
              DMNotaEntrada.QSaldoFixado.Post;
              wQtde_Fixado := wQtde_Fixado + wQtde_Fixar;
            End;
            DMNotaEntrada.QNotaFixar.Next;
          End;
          QAcertoFixar.Next;
        End;
       DMOracle.DBCemapa.Commit;
     Except
       DMOracle.DBCemapa.RollBack;
     End;
  End;
end;

procedure TFAcertoAgricola.BitBtn3Click(Sender: TObject);
begin
  If FrValorSaldoFixar = Nil Then
     FrValorSaldoFixar := TFrValorSaldoFixar.Create(Application);
  With DMRomaneioAgricola do
  Begin
    QValorFixar.Close;
    QValorFixar.SetVariable('Cadastro_I',0);
    QValorFixar.SetVariable('Cadastro_F',999999);
    QValorFixar.SetVariable('Dt_Inicial',MeDtInicial.Text);
    QValorFixar.SetVariable('Dt_Final',MeDtFinal.Text);
    If Trim(MeFilial.Text) <> '' Then
       QValorFixar.SetVariable('Cod_Filial',StrToInt(Trim(MeFilial.Text)))
    Else
       QValorFixar.SetVariable('Cod_Filial',Null);   
    QValorFixar.Open;
    FrValorSaldoFixar.QrPrimario.Preview;
  End;
end;

end.
