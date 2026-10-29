unit UEmbarqueParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmCadastro;

type
  TFEmbarqueParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label10: TLabel;
    BtEmbarque: TBitBtn;
    MEEmbarque: TMaskEdit;
    EdEmbarque: TEdit;
    Label22: TLabel;
    ME0Vendedor: TMaskEdit;
    Ed0Vendedor: TEdit;
    Bt0ConsVendedor: TBitBtn;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Me1Embarque: TMaskEdit;
    BitBtn1: TBitBtn;
    Ed1Embarque: TEdit;
    RgTipoPagto: TRadioGroup;
    TabSheet3: TTabSheet;
    Label2: TLabel;
    Me2Embarque1: TMaskEdit;
    BitBtn2: TBitBtn;
    Ed2Embarque1: TEdit;
    Me2Embarque2: TMaskEdit;
    BitBtn3: TBitBtn;
    Ed2Embarque2: TEdit;
    Me2Embarque3: TMaskEdit;
    BitBtn4: TBitBtn;
    Ed2Embarque3: TEdit;
    Me2Embarque4: TMaskEdit;
    BitBtn5: TBitBtn;
    Ed2Embarque4: TEdit;
    Label93: TLabel;
    MeFilial: TMaskEdit;
    BTConsFilial: TBitBtn;
    EdFilial: TEdit;
    TabSheet4: TTabSheet;
    Label3: TLabel;
    Me2Filial: TMaskEdit;
    Bt2ConsFilial: TBitBtn;
    Ed2Filial: TEdit;
    Label4: TLabel;
    Me2Embarque: TMaskEdit;
    Ed2Embarque: TEdit;
    Bt2Embarque: TBitBtn;
    Label7: TLabel;
    Me2Estado: TMaskEdit;
    Label8: TLabel;
    TabSheet5: TTabSheet;
    Label9: TLabel;
    Me3Embarque: TMaskEdit;
    BitBtn6: TBitBtn;
    Label11: TLabel;
    Me3Finalidade: TMaskEdit;
    BitBtn7: TBitBtn;
    Ed3Finalidade: TEdit;
    Me3Banco: TMaskEdit;
    BitBtn8: TBitBtn;
    Ed3Banco: TEdit;
    Label12: TLabel;
    Ed3Embarque: TEdit;
    Label13: TLabel;
    Ed3Placa: TEdit;
    Rg0Operacao: TRadioGroup;
    Rg2Operacao: TRadioGroup;
    Rg3Operacao: TRadioGroup;
    Rg4Operacao: TRadioGroup;
    Rg0Pintura: TRadioGroup;
    Rg0Estofaria: TRadioGroup;
    Rg1Tipo: TRadioGroup;
    Rg4OpcaoQtd: TRadioGroup;
    TabSheet6: TTabSheet;
    Label5: TLabel;
    Me4Embarque: TMaskEdit;
    BitBtn9: TBitBtn;
    Ed4Embarque: TEdit;
    Label6: TLabel;
    Me4Produto: TMaskEdit;
    BitBtn10: TBitBtn;
    Ed4Produto: TEdit;
    TabSheet7: TTabSheet;
    RG7Situacao: TRadioGroup;
    GroupBox1: TGroupBox;
    ME7DtInicio: TMaskEdit;
    ME7DtFim: TMaskEdit;
    Label14: TLabel;
    Label15: TLabel;
    TabSheet8: TTabSheet;
    Label16: TLabel;
    Me7Embarque: TMaskEdit;
    Bt7Embarque: TBitBtn;
    Ed7Embarque: TEdit;
    Label17: TLabel;
    Me3Operacao: TMaskEdit;
    BitBtn11: TBitBtn;
    Ed3Operacao: TEdit;
    TabSheet9: TTabSheet;
    Label20: TLabel;
    Me8Embarque: TMaskEdit;
    BitBtn12: TBitBtn;
    Ed8Embarque: TEdit;
    Label21: TLabel;
    Me8Cadastro: TMaskEdit;
    BitBtn13: TBitBtn;
    Ed8Cadastro: TEdit;
    TabSheet10: TTabSheet;
    ME9Embarque: TMaskEdit;
    SB9Embarque: TSpeedButton;
    GroupBox9: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    ME9DtInicial: TMaskEdit;
    ME9DtFinal: TMaskEdit;
    TabSheet11: TTabSheet;
    Label25: TLabel;
    ME9Classe: TMaskEdit;
    BitBtn14: TBitBtn;
    ED9Classe: TEdit;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ME9Data_I: TMaskEdit;
    ME9Data_F: TMaskEdit;
    Me0Operacao1: TMaskEdit;
    Label26: TLabel;
    BitBtn15: TBitBtn;
    Me0Operacao2: TMaskEdit;
    Label27: TLabel;
    BitBtn16: TBitBtn;
    Me0Operacao3: TMaskEdit;
    Label28: TLabel;
    BitBtn17: TBitBtn;
    Me0Operacao4: TMaskEdit;
    Label29: TLabel;
    BitBtn18: TBitBtn;
    GroupBox10: TGroupBox;
    Label91: TLabel;
    Label92: TLabel;
    ME0DtInicial: TMaskEdit;
    ME0DtFinal: TMaskEdit;
    Label30: TLabel;
    TabSheet12: TTabSheet;
    Label65: TLabel;
    ME10Filial: TMaskEdit;
    SB10Filial: TBitBtn;
    Ed10Filial: TEdit;
    Label66: TLabel;
    ME10Vendedor: TMaskEdit;
    SB10Vendedor: TBitBtn;
    Ed10Vendedor: TEdit;
    TabSheet13: TTabSheet;
    Label32: TLabel;
    ME13Embarque: TMaskEdit;
    BitBtn19: TBitBtn;
    Ed13Embarque: TEdit;
    TabSheet14: TTabSheet;
    c: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ME14Dtinicial: TMaskEdit;
    ME14DtFinal: TMaskEdit;
    TabSheet15: TTabSheet;
    Label37: TLabel;
    ME15Filial: TMaskEdit;
    SB15Filial: TBitBtn;
    Ed15Filial: TEdit;
    Me3ContaCorrente: TMaskEdit;
    Label38: TLabel;
    Label31: TLabel;
    Me15DtReferencia: TMaskEdit;
    TabSheet16: TTabSheet;
    GroupBox3: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    ME16Dt_Embarque_I: TMaskEdit;
    ME16Dt_Embarque_F: TMaskEdit;
    TabSheet17: TTabSheet;
    Ed17Embarque: TEdit;
    ME17Embarque: TMaskEdit;
    SB17Embarque: TSpeedButton;
    Label39: TLabel;
    RG16TipoVeiculo: TRadioGroup;
    Label40: TLabel;
    Me3DtSaida: TMaskEdit;
    Label41: TLabel;
    Me15DtReferenciaFinal: TMaskEdit;
    RG4ImpressaoData: TRadioGroup;
    RG17Tipo: TRadioGroup;
    SB16Transportador: TSpeedButton;
    ME16Transportador: TMaskEdit;
    Ed16Transportador: TEdit;
    Label42: TLabel;
    Label43: TLabel;
    MEEmbarqueInicial: TMaskEdit;
    Label44: TLabel;
    ME10Supervisor: TMaskEdit;
    SB10Supervisor: TBitBtn;
    ED10Supervisor: TEdit;
    RG10Supervisor: TRadioGroup;
    Rg16Acertado: TRadioGroup;
    MENumero: TMaskEdit;
    Lb15NEmbarque: TLabel;
    LB15Embarque: TListBox;
    BtAdicionar: TBitBtn;
    BtRetirar: TBitBtn;
    TabSheet18: TTabSheet;
    Label45: TLabel;
    SB18: TSpeedButton;
    Ed18Embarque: TEdit;
    ME18Embarque: TMaskEdit;
    Me17Classe: TMaskEdit;
    Label46: TLabel;
    Bt17Classe: TBitBtn;
    Ed17Classe: TEdit;
    TabSheet19: TTabSheet;
    Label47: TLabel;
    ME19Embarque: TMaskEdit;
    SB19Embarque: TSpeedButton;
    Ed19Embarque: TEdit;
    Label48: TLabel;
    Me10Regiao: TMaskEdit;
    Sb10Regiao: TBitBtn;
    Ed10Regiao: TEdit;
    Label49: TLabel;
    ME0Classe: TMaskEdit;
    Bt0Classe: TBitBtn;
    Ed0Classe: TEdit;
    TabSheet20: TTabSheet;
    Label50: TLabel;
    Me20CodFilial: TMaskEdit;
    Bt20ConsFilial: TBitBtn;
    Ed20DescFilial: TEdit;
    Label51: TLabel;
    Me20CodVendedor: TMaskEdit;
    Bt20ConsVendedor: TBitBtn;
    Ed20DescVendedor: TEdit;
    Label52: TLabel;
    Me20CodSupervisor: TMaskEdit;
    Bt20ConsSupervisor: TBitBtn;
    Ed20DescSupervisor: TEdit;
    Label53: TLabel;
    Me20Estado: TMaskEdit;
    Bt20Estado: TBitBtn;
    Ed20Estado: TEdit;
    RG17Data: TRadioGroup;
    Label54: TLabel;
    ME14Embarque: TMaskEdit;
    SB14Embarque: TSpeedButton;
    Label55: TLabel;
    ME14Classe: TMaskEdit;
    BT14Classe: TBitBtn;
    Ed14Classe: TEdit;
    RG3TipoNota: TRadioGroup;
    TabSheet21: TTabSheet;
    ME21DtEmbarque: TMaskEdit;
    FmCadastro21: TFmCadastro;
    Ed21Motorista: TEdit;
    Ed21Placa: TEdit;
    Label56: TLabel;
    Motorista: TLabel;
    Placa: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    ME0CLiente: TMaskEdit;
    BT0Cliente: TBitBtn;
    Ed0Cliente: TEdit;
    procedure MEEmbarqueExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtEmbarqueClick(Sender: TObject);
    procedure Bt0ConsVendedorClick(Sender: TObject);
    procedure ME0VendedorExit(Sender: TObject);
    procedure Me1EmbarqueExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Me2Embarque1Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Me2Embarque2Exit(Sender: TObject);
    procedure Me2Embarque3Exit(Sender: TObject);
    procedure Me2Embarque4Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BTConsFilialClick(Sender: TObject);
    procedure Me2FilialExit(Sender: TObject);
    procedure Me2EmbarqueExit(Sender: TObject);
    procedure Bt2ConsFilialClick(Sender: TObject);
    procedure MeFilialExit(Sender: TObject);
    procedure Me3EmbarqueExit(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure Me3FinalidadeExit(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure Bt2EmbarqueClick(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Me4EmbarqueExit(Sender: TObject);
    procedure Me4ProdutoExit(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure Bt7EmbarqueClick(Sender: TObject);
    procedure Me7EmbarqueExit(Sender: TObject);
    procedure Me3OperacaoExit(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure Me8EmbarqueExit(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure Me8CadastroExit(Sender: TObject);
    procedure SB9EmbarqueClick(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure ME9ClasseExit(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure SB10FilialClick(Sender: TObject);
    procedure SB10VendedorClick(Sender: TObject);
    procedure ME10FilialExit(Sender: TObject);
    procedure ME10VendedorExit(Sender: TObject);
    procedure ME13EmbarqueExit(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure SB15FilialClick(Sender: TObject);
    procedure ME15FilialExit(Sender: TObject);
    procedure Me3ContaCorrenteExit(Sender: TObject);
    procedure SB17EmbarqueClick(Sender: TObject);
    procedure ME17EmbarqueExit(Sender: TObject);
    procedure RG17TipoClick(Sender: TObject);
    procedure SB16TransportadorClick(Sender: TObject);
    procedure ME16TransportadorExit(Sender: TObject);
    procedure SB10SupervisorClick(Sender: TObject);
    procedure ME10SupervisorExit(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtRetirarClick(Sender: TObject);
    procedure MENumeroEnter(Sender: TObject);
    procedure MENumeroKeyPress(Sender: TObject; var Key: Char);
    procedure SB18Click(Sender: TObject);
    procedure Me17ClasseExit(Sender: TObject);
    procedure ME18EmbarqueExit(Sender: TObject);
    procedure Bt17ClasseClick(Sender: TObject);
    procedure ME19EmbarqueExit(Sender: TObject);
    procedure SB19EmbarqueClick(Sender: TObject);
    procedure Sb10RegiaoClick(Sender: TObject);
    procedure Me10RegiaoExit(Sender: TObject);
    procedure ME0ClasseExit(Sender: TObject);
    procedure Bt0ClasseClick(Sender: TObject);
    procedure Me20CodFilialExit(Sender: TObject);
    procedure Bt20ConsFilialClick(Sender: TObject);
    procedure Me20CodVendedorExit(Sender: TObject);
    procedure Bt20ConsVendedorClick(Sender: TObject);
    procedure Me20CodSupervisorExit(Sender: TObject);
    procedure Bt20ConsSupervisorClick(Sender: TObject);
    procedure Bt20EstadoClick(Sender: TObject);
    procedure Me20EstadoExit(Sender: TObject);
    procedure SB14EmbarqueClick(Sender: TObject);
    procedure ME14ClasseExit(Sender: TObject);
    procedure BT14ClasseClick(Sender: TObject);
    procedure ME0CLienteExit(Sender: TObject);
    procedure BT0ClienteClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmbarqueParam: TFEmbarqueParam;

implementation

uses UEmbarque_cl, UEmbarqueCons, UVendedorCons, UVendedor_cl, UOracle_cl,
  UFilialCons, UFilial_cl, UFinalidadeCons, UFinalidade_cl, UBancosCons,
  UBancoAgencia_cl, UOperacaoCons, UOperacao_cl, UProdutoCons, UProduto_cl,
  UCadastroCons, UCadastro_cl, UClasseCons, UClasse_cl, UContaCorrenteCons,
  URegiaoCons, URegiao_cl, UParamSistema_cl, UCidadeCons, UEstadoCons,
  UCidade_cl, UEstado_cl, UPedidoCons, UPedido_cl;

{$R *.DFM}

procedure TFEmbarqueParam.MEEmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(MEEmbarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(MEEmbarque.Text));
    QEmbarque.Open;
    EdEmbarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    EdEmbarque.Text := 'Todos';
end;

procedure TFEmbarqueParam.FormCreate(Sender: TObject);
begin
  inherited;
  MEEmbarque.Text := DMEmbarque.QEmbarqueCod_Embarque.Text;
  MEEmbarqueExit(Self);
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' Then
  Begin
    Label49.Visible := True;
    ME0Classe.Visible := True;
    Ed0Classe.Visible := True;
    Bt0Classe.Visible := True;
  end
  else
  Begin
    Label49.Visible := False;
    ME0Classe.Visible := False;
    Ed0Classe.Visible := False;
    Bt0Classe.Visible := False; 
  end;
end;

procedure TFEmbarqueParam.BtEmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    MEEmbarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    MEEmbarqueExit(Self);
  End;
end;

procedure TFEmbarqueParam.Bt0ConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
  Begin
    ME0Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    ME0VendedorExit(Self);
  End;

end;

procedure TFEmbarqueParam.ME0VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Vendedor.Text) <> '' Then
    Ed0Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME0Vendedor.Text))
  Else
    Ed0Vendedor.Text := 'Todos';

end;

procedure TFEmbarqueParam.Me1EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(ME1Embarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME1Embarque.Text));
    QEmbarque.Open;
    Ed1Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed1Embarque.Text := 'Todos';

end;

procedure TFEmbarqueParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME1Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME1EmbarqueExit(Self);
  End;

end;

procedure TFEmbarqueParam.Me2Embarque1Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque1.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque1.Text));
    QEmbarque.Open;
    Ed2Embarque1.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque1.Text := 'Todos';


end;

procedure TFEmbarqueParam.BitBtn2Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque1.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque1Exit(Self);
  End;

end;

procedure TFEmbarqueParam.Me2Embarque2Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque2.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque2.Text));
    QEmbarque.Open;
    Ed2Embarque2.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque2.Text := 'Todos';


end;

procedure TFEmbarqueParam.Me2Embarque3Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque3.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque3.Text));
    QEmbarque.Open;
    Ed2Embarque3.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque3.Text := 'Todos';


end;

procedure TFEmbarqueParam.Me2Embarque4Exit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque4.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',StrToInt(Trim(ME2Embarque4.Text)));
    QEmbarque.Open;
    Ed2Embarque4.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed2Embarque4.Text := 'Todos';


end;

procedure TFEmbarqueParam.BitBtn3Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque2.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque2Exit(Self);
  End;

end;

procedure TFEmbarqueParam.BitBtn4Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque3.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque3Exit(Self);
  End;

end;

procedure TFEmbarqueParam.BitBtn5Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque4.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2Embarque4exit(Self);
  End;

end;

procedure TFEmbarqueParam.BTConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MEFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MEFilialExit(Self);
  End;

end;

procedure TFEmbarqueParam.Me2FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Filial.Text) <> '' Then
    Ed2Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME2Filial.Text))
  Else
    Ed2Filial.Text := 'Todos';
end;

procedure TFEmbarqueParam.Me2EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(ME2Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME2Embarque.Text));
    QEmbarque.Open;
    Ed2Embarque.Text := QEmbarqueNome_Motorista.Value +' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed2Embarque.Text := 'Todos';
end;

procedure TFEmbarqueParam.Bt2ConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    ME2Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2FilialExit(Self);
  End;

end;

procedure TFEmbarqueParam.MeFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(MEFilial.Text) <> '' Then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(MEFilial.Text))
  Else
    EdFilial.Text := 'Todos';

end;

procedure TFEmbarqueParam.Me3EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME3Embarque.Text));
    QEmbarque.Open;
    Ed3Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    Ed3Placa.Text := QEmbarqueDesc_Placa.Text;
    QEmbarque.Close;
   End
  Else
    Ed3Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.BitBtn6Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME3Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed3Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
    Ed3Placa.Text := DMEmbarque.QEmbarqueConsDesc_Placa.Text;
  End;

end;

procedure TFEmbarqueParam.Me3FinalidadeExit(Sender: TObject);
begin
  inherited;
  If Trim(ME3Finalidade.Text) <> '' then
    Ed3Finalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE','COD_FINALIDADE = '+Trim(ME3Finalidade.Text))
  Else
    Ed3Finalidade.Text := 'Deve Ser Informado Uma Finalidade';

end;

procedure TFEmbarqueParam.BitBtn7Click(Sender: TObject);
begin
  inherited;
  If FFinalidadeCons = Nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  If FFinalidadeCons.ShowModal = mrOk then
  Begin
    Me3Finalidade.Text := DMFinalidade.QFinalidadeConsCod_Finalidade.Text;
    Ed3Finalidade.Text := DMFinalidade.QFinalidadeConsDesc_Finalidade.Value;
  End;

end;

procedure TFEmbarqueParam.BitBtn8Click(Sender: TObject);
begin
  inherited;
  If FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If FContaCorrenteCons.showModal = mrOk then
  Begin
    Me3Banco.Text := DMBancoAgencia.QContaCorrenteConsCod_Banco_Agencia.Text;
    Me3ContaCorrente.Text := DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Text;
    Me3ContaCorrenteExit(Self);
  End;

end;

procedure TFEmbarqueParam.Bt2EmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME2Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME2EmbarqueExit(Self);
  End;
end;

procedure TFEmbarqueParam.BitBtn9Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME4Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed4Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;

end;

procedure TFEmbarqueParam.Me4EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(Me4Embarque.Text));
    QEmbarque.Open;
    Ed4Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed4Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.Me4ProdutoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Produto.Text) <> '' then
    Ed4Produto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO = '+Trim(Me4Produto.Text))
  Else
    Ed4Produto.Text := 'Deve Ser Informado Um Produto';

end;

procedure TFEmbarqueParam.BitBtn10Click(Sender: TObject);
begin
  inherited;
  If FProdutoCons = Nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  If FProdutoCons.ShowModal = mrOk then
  Begin
    Me4Produto.Text := DMProduto.QProdutoConsCod_Produto.Text;
    Ed4Produto.Text := DMProduto.QProdutoConsDesc_Produto.Value;
  End;

end;

procedure TFEmbarqueParam.Bt7EmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    Me7Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed7Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;

end;

procedure TFEmbarqueParam.Me7EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(Me7Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(Me7Embarque.Text));
    QEmbarque.Open;
    Ed7Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed7Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.Me3OperacaoExit(Sender: TObject);
begin
  inherited;
  If Trim(Me3Operacao.Text) <> '' Then
    Ed3Operacao.Text := DMOracle.BuscaNome('SELECT DESC_OPERACAO FROM TB_OPERACAO','COD_OPERACAO = '+Me3Operacao.Text)
  Else
    Ed3Operacao.Text := '';

end;

procedure TFEmbarqueParam.BitBtn12Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    Me8Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    Ed8Embarque.Text := DMEmbarque.QEmbarqueConsNome_Motorista.Value+
                        ' = '+DMEmbarque.QEmbarqueConsDt_Embarque.Text;
  End;

end;

procedure TFEmbarqueParam.Me8EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(Me4Embarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(Me4Embarque.Text));
    QEmbarque.Open;
    Ed8Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
   End
  Else
    Ed8Embarque.Text := 'Deve Ser Informado Embarque';

end;

procedure TFEmbarqueParam.BitBtn13Click(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    Me8Cadastro.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    Ed8Cadastro.Text := DMCadastro.QCadastroConsNome.Value;
  End;
end;

procedure TFEmbarqueParam.Me8CadastroExit(Sender: TObject);
begin
  inherited;
  If Trim(Me8Cadastro.Text) <> '' Then
    Ed8Cadastro.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(Me8Cadastro.Text))
  Else
    Ed8Cadastro.Text := '';
end;

procedure TFEmbarqueParam.SB9EmbarqueClick(Sender: TObject);
begin
  inherited;
If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    Me9Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
   End;
end;

procedure TFEmbarqueParam.BitBtn14Click(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME9Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
  End;
end;

procedure TFEmbarqueParam.ME9ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me9Classe.Text) <> '' Then
    ED9Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','COD_CLASSE = '+Trim(ME9Classe.Text))
  Else
    Ed9Classe.Text := 'Todas';
end;

procedure TFEmbarqueParam.BitBtn17Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao3.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFEmbarqueParam.BitBtn16Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao2.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFEmbarqueParam.BitBtn18Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao4.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;

end;

procedure TFEmbarqueParam.BitBtn15Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
    Me0Operacao1.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
end;

procedure TFEmbarqueParam.BitBtn11Click(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.showModal = mrOk then
  Begin
    Me3Operacao.Text := DMOperacao.QOperacaoConsCod_Operacao.Text;
    Ed3Operacao.Text := DMOperacao.QOperacaoConsDesc_Operacao.Text;
  End;
end;

procedure TFEmbarqueParam.SB10FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me10Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME10FilialExit(Self);
end;

procedure TFEmbarqueParam.SB10VendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me10Vendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me10VendedorExit(Self);
end;

procedure TFEmbarqueParam.ME10FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10Filial.Text) <> '' Then
    Ed10Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME10Filial.Text))
  Else
    Ed10Filial.Text := 'Todos';
end;

procedure TFEmbarqueParam.ME10VendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10Vendedor.Text) <> '' Then
    Ed10Vendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME10Vendedor.Text))
  Else
    Ed10Vendedor.Text := 'Todos';
end;

procedure TFEmbarqueParam.ME13EmbarqueExit(Sender: TObject);
begin
  inherited;
   If Trim(ME13Embarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME13Embarque.Text));
    QEmbarque.Open;
    Ed13Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Ed13Embarque.Text := 'Todos';
end;

procedure TFEmbarqueParam.BitBtn19Click(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME13Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME13EmbarqueExit(Self);
  End;
end;

procedure TFEmbarqueParam.SB15FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me15Filial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME15FilialExit(Self);
end;

procedure TFEmbarqueParam.ME15FilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME15Filial.Text) <> '' Then
    Ed15Filial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME15Filial.Text))
  Else
    Ed15Filial.Text := 'Todos';
end;

procedure TFEmbarqueParam.Me3ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  If Trim(Me3ContaCorrente.Text) <> '' Then
   Begin
    Me3Banco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+Trim(Me3ContaCorrente.Text));
    Ed3Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+Me3Banco.Text);
   End
  Else
    Ed3Banco.Text := '';

end;

procedure TFEmbarqueParam.SB17EmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME17Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME17EmbarqueExit(Self);
  End;
end;

procedure TFEmbarqueParam.ME17EmbarqueExit(Sender: TObject);
begin
  inherited;
   If Trim(ME17Embarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME17Embarque.Text));
    QEmbarque.Open;
    Ed17Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Raise Exception.Create('É necessário informar o embarque');
end;

procedure TFEmbarqueParam.RG17TipoClick(Sender: TObject);
begin
  inherited;
  {if RG17Tipo.ItemIndex = 0 then
    RG17Estoque.Visible := False
  else
    RG17Estoque.Visible := True;   }
end;

procedure TFEmbarqueParam.SB16TransportadorClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    ME16Transportador.Text := IntToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
    ME16transportadorExit(self);
end;

procedure TFEmbarqueParam.ME16TransportadorExit(Sender: TObject);
begin
  inherited;
    If Trim(ME16Transportador.Text) <> '' Then
    Ed16Transportador.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME16Transportador.Text))
  Else
    Ed16Transportador.Text := 'Todos';


end;

procedure TFEmbarqueParam.SB10SupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me10Supervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me10SupervisorExit(Self);
end;

procedure TFEmbarqueParam.ME10SupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10Supervisor.Text) <> '' Then
    Ed10Supervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME10Supervisor.Text))
  Else
    Ed10Supervisor.Text := 'Todos';
end;

procedure TFEmbarqueParam.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  if MENumero.Text <> '' then
  Begin
     LB15Embarque.Items.Add(MENumero.Text);
     MENumero.Text := '';
     MENumero.SetFocus();
     BtRetirar.Enabled := true;
  End
  else
      ShowMessage('Informar Código Embarque');
end;

procedure TFEmbarqueParam.BtRetirarClick(Sender: TObject);
begin
  inherited;
  LB15Embarque.Items.Delete(LB15Embarque.ItemIndex);

  if LB15Embarque.Items.Count = 0 then
     BtRetirar.Enabled := false;
end;

procedure TFEmbarqueParam.MENumeroEnter(Sender: TObject);
begin
  inherited;
  BtAdicionar.Enabled := true;
end;

procedure TFEmbarqueParam.MENumeroKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = '13' then
     BtAdicionar.Click();
end;

procedure TFEmbarqueParam.SB18Click(Sender: TObject);
begin
  inherited;
   If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME18Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME18EmbarqueExit(Self);
  End;
end;

procedure TFEmbarqueParam.Me17ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me17Classe.Text) <> '' Then
    ED17Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_SUBCLASSE = 0 AND NUM_CLASSE = '+Trim(ME17Classe.Text))
  Else
    Ed17Classe.Text := 'Todas';

end;

procedure TFEmbarqueParam.ME18EmbarqueExit(Sender: TObject);
begin
  inherited;
  If Trim(ME18Embarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME18Embarque.Text));
    QEmbarque.Open;
    Ed18Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Raise Exception.Create('É necessário informar o embarque');
end;

procedure TFEmbarqueParam.Bt17ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME17Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
  End;

end;

procedure TFEmbarqueParam.ME19EmbarqueExit(Sender: TObject);
begin
  inherited;
   If Trim(ME19Embarque.Text) <> '' then
  With DMEmbarque do
  Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(ME19Embarque.Text));
    QEmbarque.Open;
    Ed19Embarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
  End
  Else
    Raise Exception.Create('É necessário informar o embarque');

end;

procedure TFEmbarqueParam.SB19EmbarqueClick(Sender: TObject);
begin
  inherited;
  If FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  If FEmbarqueCons.ShowModal = mrOk then
  Begin
    ME19Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text;
    ME19EmbarqueExit(Self);
  End;

end;

procedure TFEmbarqueParam.Sb10RegiaoClick(Sender: TObject);
begin
  inherited;
  if FRegiaoCons = Nil then
    FRegiaoCons := TFRegiaoCons.Create(Application);
  if FRegiaoCons.ShowModal = mrOk then
    Me10Regiao.Text := DMRegiao.QRegiaoConsCOD_REGIAO.Text;
    Me10RegiaoExit(Self);
end;

procedure TFEmbarqueParam.Me10RegiaoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME10Regiao.Text) <> '' Then
    Ed10Regiao.Text := DMOracle.BuscaNome('SELECT DESC_REGIAO FROM TB_REGIAO','COD_REGIAO = '+Trim(ME10Regiao.Text))
  Else
    Ed10Regiao.Text := 'Todos';
end;

procedure TFEmbarqueParam.ME0ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me0Classe.Text) <> '' Then
    ED0Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_CLASSE = '+Trim(ME0Classe.Text))
  Else
    Ed0Classe.Text := 'Todas';
end;

procedure TFEmbarqueParam.Bt0ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
    ME0Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
end;

procedure TFEmbarqueParam.Me20CodFilialExit(Sender: TObject);
begin
  inherited;
  If Trim(ME20CodFilial.Text) <> '' Then
    Ed20DescFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(ME20CodFilial.Text))
  Else
    Ed20DescFilial.Text := 'Todos';
end;

procedure TFEmbarqueParam.Bt20ConsFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
    Me20CodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME20CodFilialExit(Self);
end;

procedure TFEmbarqueParam.Me20CodVendedorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME20CodVendedor.Text) <> '' Then
    Ed20DescVendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME20CodVendedor.Text))
  Else
    Ed20DescVendedor.Text := 'Todos';
end;

procedure TFEmbarqueParam.Bt20ConsVendedorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me20CodVendedor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
    Me20CodVendedorExit(Self);
end;

procedure TFEmbarqueParam.Me20CodSupervisorExit(Sender: TObject);
begin
  inherited;
  If Trim(ME20CodSupervisor.Text) <> '' Then
    Ed20DescSupervisor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR = '+Trim(ME20CodSupervisor.Text))
  Else
    Ed20DescSupervisor.Text := 'Todos';
end;

procedure TFEmbarqueParam.Bt20ConsSupervisorClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = mrOk then
    Me20CodSupervisor.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;
  Me20CodSupervisorExit(Self);
end;

procedure TFEmbarqueParam.Bt20EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons := TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
    Me20Estado.Text := DMEstado.QEstadoConsCod_Estado.Text;
  Me20EstadoExit(Self);

end;

procedure TFEmbarqueParam.Me20EstadoExit(Sender: TObject);
begin
  inherited;
  If Trim(ME20Estado.Text) <> '' Then
    Ed20Estado.Text := DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+Chr(39)+Trim(ME20Estado.Text)+Chr(39))
  Else
    Ed20Estado.Text := 'Todos';

end;

procedure TFEmbarqueParam.SB14EmbarqueClick(Sender: TObject);
begin
  inherited;
  if FEmbarqueCons = Nil then
    FEmbarqueCons := TFEmbarqueCons.Create(Application);
  if FEmbarqueCons.ShowModal = mrOk then
    Me14Embarque.Text := DMEmbarque.QEmbarqueConsCod_Embarque.Text; 
end;

procedure TFEmbarqueParam.ME14ClasseExit(Sender: TObject);
begin
  inherited;
  If Trim(Me14Classe.Text) <> '' Then
    ED14Classe.Text := DMOracle.BuscaNome('SELECT DESC_CLASSE FROM TB_CLASSE','NUM_SUBCLASSE = 0 AND NUM_CLASSE = '+Trim(ME14Classe.Text))
  Else
    Ed14Classe.Text := 'Todas';   
end;

procedure TFEmbarqueParam.BT14ClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.Create(Application);
  If FClasseCons.ShowModal = mrOk then
  Begin
    ME14Classe.Text := DMClasse.QClasseConsNum_Classe.Text;
  End;

end;

procedure TFEmbarqueParam.ME0CLienteExit(Sender: TObject);
begin
  inherited;
  If Trim(ME0Cliente.Text) <> '' Then
    Ed0Cliente.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(ME0Cliente.Text))
  Else
    Ed0Cliente.Text := 'Todos';

end;

procedure TFEmbarqueParam.BT0ClienteClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    ME0Cliente.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
    ME0ClienteExit(Self);
  End;

end;

end.
