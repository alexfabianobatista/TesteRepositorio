unit UTipoLoteParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmLote,
  UFmSubClasse;

type
  TFTipoLoteParam = class(TFTParametro)
    TS0TipoLote: TTabSheet;
    TabSheet1: TTabSheet;
    Label103: TLabel;
    Bt1Filial: TSpeedButton;
    Me1Filial: TMaskEdit;
    Ed1Filial: TEdit;
    GroupBox8: TGroupBox;
    Label106: TLabel;
    Label107: TLabel;
    Me1Data_I: TMaskEdit;
    Me1Data_F: TMaskEdit;
    Bt1Produto: TSpeedButton;
    Label96: TLabel;
    Ed1Produto: TEdit;
    Me1Produto: TMaskEdit;
    Me1Dt_Vencimento: TMaskEdit;
    Label1: TLabel;
    TabSheet2: TTabSheet;
    FmLote2: TFmLote;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Me2DtVencimentoI: TMaskEdit;
    Me2DtVencimentoF: TMaskEdit;
    Label3: TLabel;
    RG2Ordem: TRadioGroup;
    CB2TipoProduto: TComboBox;
    Label4: TLabel;
    FmSubClasse2Final: TFmSubClasse;
    FmSubClasse2Inicial: TFmSubClasse;
    RGEstoqueLote: TRadioGroup;
    procedure Bt1FilialClick(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure Me1ProdutoExit(Sender: TObject);
    procedure Bt1ProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoLoteParam: TFTipoLoteParam;

implementation

uses UFilialCons, UOracle_cl, UProdutoCons, UFilial_cl, UProduto_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFTipoLoteParam.Bt1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = MrOk then
     Me1Filial.Text:=DMFilial.QFilialConsCod_Filial.Text;
  Me1FilialExit(Self);
end;

procedure TFTipoLoteParam.Me1FilialExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Filial.Text)<>'' then
    Ed1Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                         'COD_FILIAL = '+Me1Filial.Text)
  else
    Ed1Filial.Text := 'Todas';

end;

procedure TFTipoLoteParam.Me1ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Produto.Text) <> '' Then
    Ed1Produto.Text:=DmOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO',
                          'COD_PRODUTO='+Trim(Me1Produto.Text))
  Else
    Ed1Produto.Text := 'Todos';

end;

procedure TFTipoLoteParam.Bt1ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
    Me1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
  Me1ProdutoExit(Self);
end;

procedure TFTipoLoteParam.FormCreate(Sender: TObject);
begin
  inherited;
  if (dmparamsistema.codempresa = 'GOLDEN') then
  begin
    Me1Dt_Vencimento.Visible := true;
    Label1.Visible := true;
  end;
end;

end.
