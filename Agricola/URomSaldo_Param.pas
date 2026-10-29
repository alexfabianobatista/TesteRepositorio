unit URomSaldo_Param;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, Mask, ComCtrls, ExtCtrls, Buttons;

type
  TFRomSaldo_Param = class(TFTParametro)
    TabSheet1: TTabSheet;
    MeFilial: TMaskEdit;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    EdFilial: TEdit;
    MeCadastro: TMaskEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    EdCadastro: TEdit;
    Label5: TLabel;
    MeProduto: TMaskEdit;
    BitBtn3: TBitBtn;
    EdProduto: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    MeDataI: TMaskEdit;
    MeDataF: TMaskEdit;
    RGTipoFixacao: TRadioGroup;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Me1Filial: TMaskEdit;
    Bt1Filial: TBitBtn;
    Ed1Filial: TEdit;
    Label2: TLabel;
    Me1Cadastro: TMaskEdit;
    Bt1Cadastro: TBitBtn;
    Ed1Cadastro: TEdit;
    Label8: TLabel;
    Me1Produto: TMaskEdit;
    Bt1Produto: TBitBtn;
    Ed1Produto: TEdit;
    RG1Tipo: TRadioGroup;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Me1DataI: TMaskEdit;
    Me1DataF: TMaskEdit;
    Rg1Ordem: TRadioGroup;
    RgOrdem: TRadioGroup;
    Me1CadastroParceiro: TMaskEdit;
    Label11: TLabel;
    Bt1CadastroParceiro: TBitBtn;
    Label12: TLabel;
    MeCadastroParceiro: TMaskEdit;
    BtCadastroParceiro: TBitBtn;
    Label13: TLabel;
    ME1Departamento: TMaskEdit;
    Ed1Departamento: TEdit;
    SB1Departamento: TSpeedButton;
    Label14: TLabel;
    MEDepartamento: TMaskEdit;
    SBdepartamento: TSpeedButton;
    EdDepartamento: TEdit;
    RgResumo: TRadioGroup;
    Label15: TLabel;
    SpeedButton1: TSpeedButton;
    Me1LoteTipo: TMaskEdit;
    Ed1LoteTipo: TEdit;
    Label84: TLabel;
    Label85: TLabel;
    Me1Classe: TMaskEdit;
    ME1SubClasse: TMaskEdit;
    Bt15ConsClasse: TBitBtn;
    Ed1Classe: TEdit;
    RGSaldoZerado: TRadioGroup;
    procedure TabSheet1Exit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MeCadastroExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MeProdutoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BtOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure Me1FilialExit(Sender: TObject);
    procedure Bt1FilialClick(Sender: TObject);
    procedure Me1CadastroExit(Sender: TObject);
    procedure Bt1CadastroClick(Sender: TObject);
    procedure Me1ProdutoExit(Sender: TObject);
    procedure Bt1ProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Bt1CadastroParceiroClick(Sender: TObject);
    procedure BtCadastroParceiroClick(Sender: TObject);
    procedure SB1DepartamentoClick(Sender: TObject);
    procedure ME1DepartamentoExit(Sender: TObject);
    procedure SBdepartamentoClick(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure Me1LoteTipoExit(Sender: TObject);
    procedure Bt15ConsClasseClick(Sender: TObject);
    procedure ME1SubClasseExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRomSaldo_Param: TFRomSaldo_Param;

implementation

uses UFilial_cl, UFilialCons, UCadastro_cl, UCadastroCons, UProduto_cl,
  UProdutoCons, UUsuario_cl, UOracle_cl, UDepartamentoCons,
  UDepartamento_cl, UTipoLoteCons, UTipoLote_cl, UClasseCons, UClasse_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFRomSaldo_Param.TabSheet1Exit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL=' +Trim(MeFilial.Text))
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFRomSaldo_Param.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
     EdFilial.Text := DmFilial.QFilialConsDesc_Filial.Text;
  end;

end;

procedure TFRomSaldo_Param.MeCadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(MECadastro.Text) <> '' Then
     EdCadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO=' +Trim(MECadastro.Text))
  Else
    EdCadastro.Text := 'Todos';

end;

procedure TFRomSaldo_Param.BitBtn2Click(Sender: TObject);
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

procedure TFRomSaldo_Param.MeProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(MEProduto.Text) <> '' Then
     EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO=' +Trim(MEProduto.Text))
  Else
    EdProduto.Text := 'Todos';

end;

procedure TFRomSaldo_Param.BitBtn3Click(Sender: TObject);
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

procedure TFRomSaldo_Param.BtOkClick(Sender: TObject);
begin
  inherited;
  IF MEDataI.Text = '' then
     ShowMessage('Informar Data Inicial');
  IF MEDataF.Text = '' then
     ShowMessage('Informar Data Inicial');
  IF StrToDate(MEDataI.Text) > StrToDate(MEDataF.Text) then
     ShowMessage('Data Inicial Não Pode Ser Maior Que Data Final');

end;

procedure TFRomSaldo_Param.FormCreate(Sender: TObject);
begin
  inherited;
  MEDataI.Text := DateToStr(Date);
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
     MEDataI.Text := '01/01/2009';
  MEDataF.Text := DateToStr(Date);
  MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  MeFilialExit(Self);
end;

procedure TFRomSaldo_Param.MeFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL=' +Trim(MeFilial.Text))
  Else
    EdFilial.Text := 'Todos';
end;

procedure TFRomSaldo_Param.Me1FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Filial.Text) <> '' Then
     Ed1Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL=' +Trim(ME1Filial.Text))
  Else
    Ed1Filial.Text := 'Todos';
end;

procedure TFRomSaldo_Param.Bt1FilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = nil then
     FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOK then
  begin
     Me1Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
     Ed1Filial.Text := DmFilial.QFilialConsDesc_Filial.Text;
  end;

end;

procedure TFRomSaldo_Param.Me1CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Cadastro.Text) <> '' Then
     Ed1Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO=' +Trim(ME1Cadastro.Text))
  Else
    Ed1Cadastro.Text := 'Obrigado Informar Código Cadastro';

end;

procedure TFRomSaldo_Param.Bt1CadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
  begin
     Me1Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
     Ed1Cadastro.Text := DMCadastro.QCadastroConsNome.Text
  end;
end;

procedure TFRomSaldo_Param.Me1ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Produto.Text) <> '' Then
     Ed1Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO=' +Trim(ME1Produto.Text))
  Else
    Ed1Produto.Text := 'Todos';

end;

procedure TFRomSaldo_Param.Bt1ProdutoClick(Sender: TObject);
begin
  inherited;
  If FProdutoCons = nil then
     FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOK then
  begin
     Me1Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
     Ed1Produto.Text := DmProduto.QProdutoConsDesc_Produto.Text
  end;

end;

procedure TFRomSaldo_Param.FormActivate(Sender: TObject);
begin
  inherited;
  MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  Me1Filial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  MeCadastroParceiro.Text := DMUsuario.pCodParceria;
  Me1CadastroParceiro.Text := DMUsuario.pCodParceria;
  MeCadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Me1CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  BtCadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
  Bt1CadastroParceiro.Enabled := DMUsuario.pCodParceria = '';
end;

procedure TFRomSaldo_Param.Bt1CadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     Me1CadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFRomSaldo_Param.BtCadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOK then
     MeCadastroParceiro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFRomSaldo_Param.SB1DepartamentoClick(Sender: TObject);
begin
  inherited;
  If FTipoLoteCons = nil then
     FTipoLoteCons := TFTipoLoteCons.Create(Application);
  If FTipoLoteCons.ShowModal = mrOK then
     Me1LoteTipo.Text := DMTipoLote.QTipoLoteConsCOD_LOTE_TIPO.Text;
  Me1LoteTipoExit(Self);
end;

procedure TFRomSaldo_Param.ME1DepartamentoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Departamento.Text) <> '' then
    Ed1Departamento.Text:= DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+ME1Departamento.Text)
  else
    Ed1Departamento.Text := 'Todos';
end;

procedure TFRomSaldo_Param.SBdepartamentoClick(Sender: TObject);
begin
  inherited;
   If FDepartamentoCons = nil then
     FDepartamentoCons := TFDepartamentoCons.Create(Application);
  If FDepartamentoCons.ShowModal = mrOK then
     MeDepartamento.Text := DMDepartamento.QDepartamentoConsCod_Departamento.Text;
  MeDepartamentoExit(Self);
end;

procedure TFRomSaldo_Param.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
   if Trim(MEDepartamento.Text) <> '' then
    EdDepartamento.Text:= DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+MEDepartamento.Text)
  else
    EdDepartamento.Text := 'Todos';
end;

procedure TFRomSaldo_Param.Me1LoteTipoExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1LoteTipo.Text) <> '' then
    Ed1LoteTipo.Text:= DMOracle.BuscaNome('SELECT DESC_LOTE FROM TB_LOTE_TIPO','COD_LOTE_TIPO = '+Me1LoteTipo.Text)
  else
    Ed1LoteTipo.Text := 'Todos';

end;

procedure TFRomSaldo_Param.Bt15ConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    Me1Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
    Me1SubClasse.Text := DMClasse.QClasseConsNum_SubClasse.Text;
    Me1SubClasseExit(Self);
  End;

end;

procedure TFRomSaldo_Param.ME1SubClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me1Classe.Text) = '' Then
  Begin
    Ed1Classe.Text := 'Todos';
    Me1SubClasse.Text := '';
  End
  Else
    If Trim(Me1SubClasse.Text) = '' then
    Begin
      Ed1Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me1Classe.Text+
                                           'AND NUM_SUBCLASSE = 0');
      Me1SubClasse.Text := '0';
    End
    Else
      Ed1Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE',
                                           'NUM_CLASSE = '+Me1Classe.Text+
                                           'AND NUM_SUBCLASSE = '+Me1SubClasse.Text);

end;

end.
