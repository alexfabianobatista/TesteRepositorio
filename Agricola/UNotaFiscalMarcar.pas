unit UNotaFiscalMarcar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFNotaFiscalMarcar = class(TFTCadSimples)
    Label46: TLabel;
    SBFilial: TSpeedButton;
    MEFilial: TMaskEdit;
    EdFilial: TEdit;
    GroupBox7: TGroupBox;
    Label53: TLabel;
    Label54: TLabel;
    MEDataI: TMaskEdit;
    MEDataF: TMaskEdit;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BtOk: TBitBtn;
    Label1: TLabel;
    SbProduto: TSpeedButton;
    MeProduto: TMaskEdit;
    EdProduto: TEdit;
    procedure SBFilialClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure SbProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaFiscalMarcar: TFNotaFiscalMarcar;

implementation

uses UAgricola_cl, UOracle_cl, UFilialCons, UFilial_cl, UProdutoCons,
  UProduto_cl;

{$R *.DFM}

procedure TFNotaFiscalMarcar.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCOD_FILIAL.Text;
  MeFilialExit(Self);

end;

procedure TFNotaFiscalMarcar.BitBtn1Click(Sender: TObject);
begin
  inherited;
  With DmAgricola do
  Begin
    QMarcarNotas.Close;
    If Trim(MeFilial.Text) <> '' Then
       QMarcarNotas.SetVariable('Cod_Filial',Trim(MeFilial.Text))
    Else
       QMarcarNotas.SetVariable('Cod_Filial',Null);
    If Trim(MeProduto.Text) <> '' Then
       QMarcarNotas.SetVariable('Cod_Produto',Trim(MeProduto.Text))
    Else
       QMarcarNotas.SetVariable('Cod_Produto',Null);
    QMarcarNotas.SetVariable('Data_I',MeDataI.Text);
    QMarcarNotas.SetVariable('Data_F',MeDataF.Text);
    QMarcarNotas.Open;
  End;
end;

procedure TFNotaFiscalMarcar.BitBtn2Click(Sender: TObject);
Var wSimNao,wComando:String;
begin
  inherited;
  wSimNao := 'NAO';
  If DMAgricola.QMarcarNotasInd_Milhagem.Value = 'NAO'  // estou reaproveitando este campo milhagem
  Then                                                    // para marcar notas para nao sair no relatorio
     wSimNao := 'SIM';                                    // frfechamentocereais1
  With DMOracle do
  Begin
    QExecSQL.Close;
    QExecSQL.SQL.Clear;
    wComando := 'UPDATE TB_NOTA_CAB SET IND_MILHAGEM = '+ chr(39) + wSimNao +chr(39);
    wComando := wComando + ' WHERE COD_NOTA_CAB = '+FloatToStr(DMAgricola.QMarcarNotasCod_Nota_Cab.Value);
    QExecSQL.SQL.Add(wComando);
    QExecSQL.ExecSQL;
    DMOracle.dbCemapa.Commit;
  End;

end;

procedure TFNotaFiscalMarcar.MEFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MEFilial.Text) <> '' then
    EdFilial.Text:= DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MEFilial.Text)
  else
    EdFilial.Text := 'Todas';


end;

procedure TFNotaFiscalMarcar.MeProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEProduto.Text) <> '' then
    EdProduto.Text:= DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+MEProduto.Text)
  else
    EdProduto.Text := 'Todas';
end;

procedure TFNotaFiscalMarcar.SbProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  if FProdutoCons.showModal = mrOk then
    MeProduto.Text := DMProduto.QProdutoConsCOD_PRODUTO.Text;
  MeProdutoExit(Self);
end;

end.
