unit URRomaneioNotas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask,
  UFmContaCorrente, UFmFinalidade;


type
  TFrRomNotaParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label3: TLabel;
    MeFilial: TMaskEdit;
    BitBtn1: TBitBtn;
    EdFilial: TEdit;
    MeCadastro: TMaskEdit;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    EdCadastro: TEdit;
    MeProduto: TMaskEdit;
    Label5: TLabel;
    EdProduto: TEdit;
    BitBtn3: TBitBtn;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    MeDataI: TMaskEdit;
    Label7: TLabel;
    MeDataF: TMaskEdit;
    RgTipoRomaneio: TRadioGroup;
    Label1: TLabel;
    MeRomaneio: TMaskEdit;
    BitBtn4: TBitBtn;
    Label2: TLabel;
    MeParceiro: TMaskEdit;
    BtParceiro: TBitBtn;
    Label8: TLabel;
    FmContaCorrente: TFmContaCorrente;
    FmFinalidade: TFmFinalidade;
    CBCondicaoPagto: TComboBox;
    Label9: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BtParceiroClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrRomNotaParam: TFrRomNotaParam;

implementation

uses UFilialCons, UFilial_cl, UCadastroCons, UCadastro_cl, UProdutoCons,
  UProduto_cl, UUsuario_cl, URomaneioCons, URomaneioAgricola_cl;

{$R *.DFM}

procedure TFrRomNotaParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     EdFilial.Text := DmFilial.QFilialConsDesc_Filial.Text
  end;

end;

procedure TFrRomNotaParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     MeCadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     EdCadastro.Text := DmCadastro.QCadastroConsNome.Text
  end;

end;

procedure TFrRomNotaParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     MeProduto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     EdProduto.Text := DmProduto.QProdutoConsDesc_Produto.Text
  end;

end;

procedure TFrRomNotaParam.BtOkClick(Sender: TObject);
begin
  inherited;
  If trim(MeDataI.Text) = '' then
  begin
    showMessage('Informar Data Inicial');
    ModalResult:=MrNone;
  end;
  If trim(MeDataF.Text) = '' then
  begin
    showMessage('Informar Data Final');
    ModalResult:=MrNone;
  end;
  If StrToDate(MeDataF.Text) < StrToDate(MeDataI.Text) then
  begin
    showMessage('Data Final Menor Data Inicial');
    ModalResult:=MrNone;
  end;

end;

procedure TFrRomNotaParam.MeProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(MEProduto.Text) <> '' Then
  With DMProduto do
  Begin
    QProduto.Close;
    QProduto.SetVariable('PK',StrToInt(Trim(MEProduto.Text)));
    QProduto.Open;
    EdProduto.Text := QProdutoDesc_Produto.Text
  End
  Else
    EdProduto.Text := 'Informar Código Produto';

end;

procedure TFrRomNotaParam.MeCadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(MECadastro.Text) <> '' Then
  With DMCadastro do
  Begin
    QCadastro.Close;
    QCadastro.SetVariable('PK',MECadastro.Text);
    QCadastro.Open;
    EdCadastro.Text := QCadastroNome.Text
  End
  Else
    EdCadastro.Text := 'Todos';

end;

procedure TFrRomNotaParam.MeFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MEFilial.Text);
    QFilial.Open;
    EdFilial.Text := QFilialDesc_Filial.Text
  End
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFrRomNotaParam.FormActivate(Sender: TObject);
begin
  inherited;
  //MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  MeDataI.Text := DateToStr(Date);
  MeDataF.Text := DateToStr(Date);
end;

procedure TFrRomNotaParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FRomaneioCons = nil then
     FRomaneioCons := TFRomaneioCons.Create(Application);
  If FRomaneioCons.ShowModal = mrOK then
     MeRomaneio.Text := DMRomaneioAgricola.QRomaneioConsNum_Romaneio.Text;
end;

procedure TFrRomNotaParam.BtParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     MeParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

end.
