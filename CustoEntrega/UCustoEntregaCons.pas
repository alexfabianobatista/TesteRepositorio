unit UCustoEntregaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFCustoEntregaCons = class(TFTConsulta)
    SBFilialCons: TSpeedButton;
    MEFilialCons: TMaskEdit;
    EdFilialCons: TEdit;
    MEVendedorCons: TMaskEdit;
    SBVendedorCons: TSpeedButton;
    EdVendedorCons: TEdit;
    Label2: TLabel;
    MEDtInicialCons: TMaskEdit;
    MEDtFinalCons: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    RGSituacaoCons: TRadioGroup;
    MECodNotaCons: TMaskEdit;
    SBCodNotaCons: TSpeedButton;
    procedure SBFilialConsClick(Sender: TObject);
    procedure MEFilialConsExit(Sender: TObject);
    procedure SBVendedorConsClick(Sender: TObject);
    procedure MEVendedorConsExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SBCodNotaConsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCustoEntregaCons: TFCustoEntregaCons;

implementation

uses UFilialCons, UOracle_cl, UVendedorCons, UCustoEntrega_cl, UFilial_cl,
  UVendedor_cl, UNotaSaidaCons, UNotaSaida_cl;

{$R *.DFM}

procedure TFCustoEntregaCons.SBFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    MEFilialCons.Text:=DMFilial.QFilialConsCod_Filial.Text;
    MEFilialConsExit(Self);
end;

procedure TFCustoEntregaCons.MEFilialConsExit(Sender: TObject);
begin
  inherited;
  if Trim(MEFilialCons.text)<>'' then
    EdFilialCons.text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilialCons.text)
  else
    EdFilialCons.Text:='Todas';
end;

procedure TFCustoEntregaCons.SBVendedorConsClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    MEVendedorCons.Text:=DMVendedor.QVendedorConsCod_Vendedor.Text;
    MEVendedorConsExit(Self);
end;

procedure TFCustoEntregaCons.MEVendedorConsExit(Sender: TObject);
begin
  inherited;
  if Trim(MEVendedorCons.text)<>'' then
    EdVendedorCons.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+MEVendedorCons.text)
  else
    EdVendedorCons.Text:='Todos';
end;

procedure TFCustoEntregaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
   With DMCustoEntrega do
  Begin
    QCustoEntregaCons.Close;

    If Trim(MEFilialCons.Text) <> '' Then
      QCustoEntregaCons.SetVariable('FILIAL',StrToInt(Trim(MEFilialCons.Text)))
    Else
      QCustoEntregaCons.SetVariable('FILIAL',Null);

    If Trim(MeVendedorCons.Text) <> '' Then
      QCustoEntregaCons.SetVariable('VENDEDOR',StrToInt(Trim(MeVendedorCons.Text)))
    Else
      QCustoEntregaCons.SetVariable('VENDEDOR',Null);

    If Trim(MeCodNotaCons.Text) <> '' Then
      QCustoEntregaCons.SetVariable('NOTA',Trim(MeCodNotaCons.Text))
    Else
      QCustoEntregaCons.SetVariable('NOTA',Null);
    if ((MEDtInicialCons.Text) <> '') and ((MEDtFinalCons.Text) <> '') then
    Begin
      QCustoEntregaCons.SetVariable('DT_INICIAL',StrToDate(MEDtInicialCons.Text));
      QCustoEntregaCons.SetVariable('DT_FINAL',StrToDate(MEDtFinalCons.Text));
    end
    else
      Raise Exception.Create('É necessário informar o período!');
    Case RgSituacaoCons.ItemIndex of
      0 : QCustoEntregaCons.SetVariable('SITUACAO','PENDENTE');
      1 : QCustoEntregaCons.SetVariable('SITUACAO','EM TRANSITO');
      2 : QCustoEntregaCons.SetVariable('SITUACAO','ENTREGUE');
      3 : QCustoEntregaCons.SetVariable('SITUACAO',NULL);
    End;
    QCustoEntregaCons.Open;
  end;
end;
procedure TFCustoEntregaCons.SBCodNotaConsClick(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCons = Nil then
    FNotaSaidaCons:=TFNotaSaidaCons.Create(Application);
  if FNotaSaidaCons.ShowModal = mrOk then
    With DMCustoEntrega do
      MECodNotaCons.Text:=IntToStr(DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
end;

end.

