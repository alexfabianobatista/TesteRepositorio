unit UOrdemServicoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmFilial,
  UFmCadastro, UFmVendedor, UFmVeiculo, UFmSerie, UFmOperacao, DBPanel, DB,
  UFmProduto;

type
  TTipoItem = (tiProduto, tiServico);

  TItemNota = class
  public
    FDescProduto: String;
    FCFOP: Integer;
//    FCodProduto: Integer;
    FCodProduto: real;
    FQtQuantidade: Extended;
    FValUn: Extended;
    FCodLote: Integer;
    FCodTrib: Integer;
    FValTotal: Extended;
    FDescCpl: string;
    FValDesc: Extended;
    FValCusto: Extended;
    FValIpi: Extended;
    FTipoItem: TTipoItem;
    FValISS: Extended;
  end;

  TFOrdemServicoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    ME2DataI: TMaskEdit;
    ME2DataF: TMaskEdit;
    TabSheet4: TTabSheet;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Me3DataI: TMaskEdit;
    Me3DataF: TMaskEdit;
    TabSheet5: TTabSheet;
    RG4Situacao: TRadioGroup;
    TabSheet6: TTabSheet;
    RG5Situacao: TRadioGroup;
    GroupBox5: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Me5DtInicial: TMaskEdit;
    Me5DtFinal: TMaskEdit;
    GroupBox6: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Me4DtInicial: TMaskEdit;
    Me4DtFinal: TMaskEdit;
    FmFilial1: TFmFilial;
    FmCadastro1: TFmCadastro;
    FmFilial2: TFmFilial;
    FmCadastro2: TFmCadastro;
    FmFilial3: TFmFilial;
    FmFilial4: TFmFilial;
    FmCadastro4: TFmCadastro;
    FmVendedor4: TFmVendedor;
    FmFilial5: TFmFilial;
    FmFilial6: TFmFilial;
    FmVeiculo1: TFmVeiculo;
    FmVeiculo2: TFmVeiculo;
    ME0Placa: TMaskEdit;
    Label1: TLabel;
    ME1Placa: TMaskEdit;
    Label6: TLabel;
    TSGeraNF: TTabSheet;
    Shape1: TShape;
    P6Produtos: TPanel;
    LB6Produtos: TListBox;
    Label9: TLabel;
    FM6OperacaoProduto: TFmOperacao;
    P6Servicos: TPanel;
    Label10: TLabel;
    LB6Servicos: TListBox;
    FM6OperacaoServico: TFmOperacao;
    BitBtn1: TBitBtn;
    btSerieCons: TBitBtn;
    MeSerieProd: TMaskEdit;
    MeModeloSerieProd: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    MeModeloSerieServ: TMaskEdit;
    MeSerieServ: TMaskEdit;
    Label15: TLabel;
    Label16: TLabel;
    CB01Ordem: TComboBox;
    Label17: TLabel;
    CB02Ordem: TComboBox;
    Label18: TLabel;
    Label23: TLabel;
    CB03Ordem: TComboBox;
    CB04Ordem: TComboBox;
    Label24: TLabel;
    FMFilialProdutos: TFmFilial;
    FMFilialServico: TFmFilial;
    Rg4Cobranca: TRadioGroup;
    Cb4Ordem: TComboBox;
    Label25: TLabel;
    RGOpcaoBaixa3: TRadioGroup;
    GroupBox7: TGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Me3DataFI: TMaskEdit;
    Me3DataFF: TMaskEdit;
    FmProduto2: TFmProduto;
    FmCadastro3: TFmCadastro;
    FMTecnico: TFmVendedor;
    RGSituacaoOS3: TRadioGroup;
    FmVendedor1: TFmVendedor;
    FmTecnico2: TFmVendedor;
    FmSupervisor2: TFmVendedor;
    FmVendedor2: TFmVendedor;
    FmTecnico1: TFmVendedor;
    FmSupervisor1: TFmVendedor;
    EdModelo: TEdit;
    BtModelo: TBitBtn;
    MeModelo: TMaskEdit;
    Label28: TLabel;
    FmOperacao2: TFmOperacao;
    RGSituacaoOrdem: TRadioGroup;
    GroupBox8: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    ME1DataIEntrada: TMaskEdit;
    ME1DataFEntrada: TMaskEdit;
    GroupBox2: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    ME1DataI: TMaskEdit;
    ME1DataF: TMaskEdit;
    RGSituacaoOrdemSintetico: TRadioGroup;
    GroupBox9: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    ME0DataIEntrada: TMaskEdit;
    ME0DataFEntrada: TMaskEdit;
    GroupBox10: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    ME0DataI: TMaskEdit;
    ME0DataF: TMaskEdit;
    FmProduto1: TFmProduto;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure FmFilial1MeFilialExit(Sender: TObject);
    procedure FmVeiculo1BtVeiculoClick(Sender: TObject);

    procedure FM6OperacaoProdutoMeOperacaoExit(Sender: TObject);
    procedure FM6OperacaoServicoMeOperacaoExit(Sender: TObject);
    procedure btSerieConsClick(Sender: TObject);
    
    procedure BitBtn1Click(Sender: TObject);
    procedure FM6OperacaoProdutoBtOperacaoClick(Sender: TObject);
    procedure FMFilialProdutosBtFilialClick(Sender: TObject);
    procedure FMFilialSevicoBtFilialClick(Sender: TObject);
    procedure FMFilialProdutosMeFilialExit(Sender: TObject);
    procedure FMFilialSevicoMeFilialExit(Sender: TObject);
    procedure GroupBox7Exit(Sender: TObject);
    procedure FmVeiculo2BtVeiculoClick(Sender: TObject);
    procedure FmCadastro3BtCadastroClick(Sender: TObject);
    procedure BtModeloClick(Sender: TObject);
    procedure RGSituacaoOrdemExit(Sender: TObject);
    procedure RGSituacaoOrdemClick(Sender: TObject);
    procedure RGSituacaoOrdemSinteticoClick(Sender: TObject);
  private
    procedure SetProdutos6(const Value: TList);
    procedure CarregaListBox(LB: TListBox; Items: TList);
    procedure SetServicos6(const Value: TList);
  public
    property Produtos6: TList write SetProdutos6;
    property Servicos6: TList write SetServicos6;
  end;

var
  FOrdemServicoParam: TFOrdemServicoParam;

implementation

uses UFilial_cl, UFilialCons, UUsuario_cl, UCadastroCons, UCadastro_cl,
  UOracle_cl, UVendedorCons, UVendedor_cl, UNotaSaida_cl, USerieCons,
  USerie_cl, UBiblioteca, UParamSistema_cl, UVeiculoModeloCons,
  UVeiculoModelo_cl;

{$R *.DFM}

procedure TFOrdemServicoParam.FormCreate(Sender: TObject);
Var wAno,wMes,wDia : Word;
begin
  inherited;
  DecodeDate(Date,wAno,wMes,wDia);
  ME0DataIEntrada.Text := '01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno);
  ME0DataFEntrada.Text := DateToStr( Date );
  ME0DataI.Text := '01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno);
  ME0DataF.Text := DateToStr( Date );
  FmFilial1.MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial1.MeFilialExit(Self);
  ME1DataIEntrada.Text := ME0DataI.Text;
  ME1DataFEntrada.Text := ME0DataF.Text;
  ME1DataI.Text := ME0DataI.Text;
  ME1DataF.Text := ME0DataF.Text;
  FmFilial2.MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial2.MeFilialExit(Self);
  ME2DataI.Text := ME0DataI.Text;
  ME2DataF.Text := ME0DataF.Text;
  FmFilial3.MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial3.MeFilialExit(Self);
  ME3DataI.Text := '01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno);
  ME3DataF.Text := DateToStr( Date );
  FmFilial4.MeFilial.Text := FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial4.MeFilialExit(Self);
  if (DMParamSistema.CodEmpresa = 'GEOPRO') or (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
  begin
    RGOpcaoBaixa3.Visible := False;
    RGSituacaoOS3.Visible := True;
  end;

  if (DMParamSistema.CodEmpresa = 'GEOPRO') then
  begin
    RGSituacaoOrdem.Items.Clear;
    RGSituacaoOrdem.Items.Add('Aberta');
    RGSituacaoOrdem.Items.Add('Arquivada');
    RGSituacaoOrdem.Items.Add('Cortesia');
    RGSituacaoOrdem.Items.Add('Fechada');
    RGSituacaoOrdem.Items.Add('Finalizada');
    RGSituacaoOrdem.Items.Add('Todas');
    RGSituacaoOrdem.Height := 150;
    RGSituacaoOrdem.ItemIndex := 5;

    RGSituacaoOrdemSintetico.Items.Clear;
    RGSituacaoOrdemSintetico.Items.Add('Aberta');
    RGSituacaoOrdemSintetico.Items.Add('Arquivada');
    RGSituacaoOrdemSintetico.Items.Add('Cortesia');
    RGSituacaoOrdemSintetico.Items.Add('Fechada');
    RGSituacaoOrdemSintetico.Items.Add('Finalizada');
    RGSituacaoOrdemSintetico.Items.Add('Todas');
    RGSituacaoOrdemSintetico.Height := 150;
    RGSituacaoOrdemSintetico.ItemIndex := 5;

    RGSituacaoOS3.Items.Clear;
    RGSituacaoOS3.Items.Add('Aberta');
    RGSituacaoOS3.Items.Add('Arquivada');
    RGSituacaoOS3.Items.Add('Cortesia');
    RGSituacaoOS3.Items.Add('Fechada');
    RGSituacaoOS3.Items.Add('Finalizada');
    RGSituacaoOS3.Items.Add('Todas');
    RGSituacaoOS3.Height := 150;
    RGSituacaoOS3.ItemIndex := 5;
  end;

  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') then
  begin
    RGSituacaoOS3.Items.Strings[2] := 'Garantia';
  end;

end;

procedure TFOrdemServicoParam.FormActivate(Sender: TObject);
begin
  inherited;
  FmFilial1.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial2.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial3.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial4.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
//  FmFilial5.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial5.MeFilialExit(Self);
  FmFilial6.MeFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
  FmFilial6.MeFilialExit(Self);

end;

procedure TFOrdemServicoParam.TabSheet1Show(Sender: TObject);
begin
  inherited;
  FOrdemServicoParam.helpcontext:=3;
end;

procedure TFOrdemServicoParam.TabSheet2Show(Sender: TObject);
begin
  inherited;
  FOrdemServicoParam.helpcontext:=4;
end;

procedure TFOrdemServicoParam.TabSheet3Show(Sender: TObject);
begin
  inherited;
  FOrdemServicoParam.helpcontext:=5;
end;

procedure TFOrdemServicoParam.TabSheet4Show(Sender: TObject);
begin
  inherited;
  FOrdemServicoParam.helpcontext:=7;
end;

procedure TFOrdemServicoParam.TabSheet5Show(Sender: TObject);
begin
  inherited;
  FOrdemServicoParam.helpcontext:=12;
end;

procedure TFOrdemServicoParam.FmFilial1MeFilialExit(Sender: TObject);
begin
  inherited;
  FmFilial1.MeFilialExit(Sender);

end;

procedure TFOrdemServicoParam.FmVeiculo1BtVeiculoClick(Sender: TObject);
begin
  inherited;
  FmVeiculo1.BtVeiculoClick(Sender);
end;

procedure TFOrdemServicoParam.CarregaListBox(LB: TListBox; Items: TList);
var
  i: Integer;
  It: TListItem;
  ItN: TItemNota;
begin
  LB.Clear;
  for i := 0 to Items.Count - 1 do
  begin
    ItN := TItemNota(Items[i]);
    LB.Items.Add(ItN.FDescProduto + ' - ' + ItN.FDescCpl);
  end;
end;

procedure TFOrdemServicoParam.SetProdutos6(const Value: TList);
begin
  CarregaListBox(LB6Produtos, Value);
end;

procedure TFOrdemServicoParam.SetServicos6(const Value: TList);
begin
  CarregaListBox(LB6Servicos, Value);
end;

procedure TFOrdemServicoParam.FM6OperacaoProdutoMeOperacaoExit(
  Sender: TObject);
begin
  inherited;
  FM6OperacaoProduto.MeOperacaoExit(Sender);
  if Trim(FM6OperacaoProduto.MeOperacao.Text) = '' then
    FM6OperacaoProduto.EdOperacao.Text := '';
end;

procedure TFOrdemServicoParam.FM6OperacaoServicoMeOperacaoExit(
  Sender: TObject);
begin
  inherited;
  FM6OperacaoServico.MeOperacaoExit(Sender);
  if Trim(FM6OperacaoServico.MeOperacao.Text) = '' then
    FM6OperacaoServico.MeOperacao.Text := '';
end;

procedure TFOrdemServicoParam.btSerieConsClick(Sender: TObject);
begin
  inherited;
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = MrOk then
  begin
    with DMSerie do
    begin
      MeSerieProd.Text :=
        QSerieConsCOD_SERIE.Value;
      MeModeloSerieProd.Text :=
        QSerieConsCOD_SERIE_MODELO.Value;
    end;
  end;
end;

procedure TFOrdemServicoParam.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  FSerieCons.BtProcurarClick(Sender);
  if FSerieCons.ShowModal = MrOk then
  begin
    with DMSerie do
    begin
      MeSerieServ.Text :=
        QSerieConsCOD_SERIE.Value;
      MeModeloSerieServ.Text :=
        QSerieConsCOD_SERIE_MODELO.Value;
    end;
  end;
end;

procedure TFOrdemServicoParam.FM6OperacaoProdutoBtOperacaoClick(
  Sender: TObject);
begin
  inherited;
  FM6OperacaoProduto.BtOperacaoClick(Sender);

end;

procedure TFOrdemServicoParam.FMFilialProdutosBtFilialClick(
  Sender: TObject);
begin
  inherited;
  FMFilialProdutos.BtFilialClick(Sender);

end;

procedure TFOrdemServicoParam.FMFilialSevicoBtFilialClick(Sender: TObject);
begin
  inherited;
  FMFilialServico.BtFilialClick(Sender);

end;

procedure TFOrdemServicoParam.FMFilialProdutosMeFilialExit(
  Sender: TObject);
begin
  inherited;
  FMFilialProdutos.MeFilialExit(Sender);
  if Trim(FMFilialProdutos.MeFilial.Text) = '' then
    FMFilialProdutos.EdFilial.Text := '';
end;

procedure TFOrdemServicoParam.FMFilialSevicoMeFilialExit(Sender: TObject);
begin
  inherited;
  FMFilialServico.MeFilialExit(Sender);
  if Trim(FMFilialServico.MeFilial.Text) = '' then
    FMFilialServico.EdFilial.Text := '';
end;

procedure TFOrdemServicoParam.GroupBox7Exit(Sender: TObject);
begin
  inherited;
  if (Trim(Me3DataFI.Text) <> '') and (Trim(Me3DataFF.Text) <> '') then
    RGOpcaoBaixa3.ItemIndex := 2
  else
    RGOpcaoBaixa3.ItemIndex := 1;
end;

procedure TFOrdemServicoParam.FmVeiculo2BtVeiculoClick(Sender: TObject);
begin
  inherited;
  FmVeiculo2.BtVeiculoClick(Sender);

end;

procedure TFOrdemServicoParam.FmCadastro3BtCadastroClick(Sender: TObject);
begin
  inherited;
  FmCadastro3.BtCadastroClick(Sender);

end;

procedure TFOrdemServicoParam.BtModeloClick(Sender: TObject);
begin
  inherited;
  if FVeiculoModeloCons = nil then
     FVeiculoModeloCons := TFVeiculoModeloCons.Create(Application);
  if FVeiculoModeloCons.ShowModal = mrOk then
  with DMVeiculoModelo do
  begin
    QVeiculoModeloCad.Close;
    QVeiculoModeloCad.SetVariable('PK',QVeiculoModeloConsCOD_MODELO.Value);
    QVeiculoModeloCad.Open;
    MeModelo.Text := QVeiculoModeloConsCOD_MODELO.Text;
    EdModelo.Text := QVeiculoModeloConsDESC_MODELO.Text;
  end;  
end;

procedure TFOrdemServicoParam.RGSituacaoOrdemExit(Sender: TObject);
begin
  inherited;
  if RGSituacaoOrdem.ItemIndex = 1 then
  begin
    if ME1DataIEntrada.Text = '' then
      ShowMessage('Para listar ordens abertas, informar a data de entrada!');
  end;
end;

procedure TFOrdemServicoParam.RGSituacaoOrdemClick(Sender: TObject);
begin
  inherited;
  // Desativa a edição dos campos data de saída das ordens para Ordens ABERTAS
  if RGSituacaoOrdem.ItemIndex = 1 then
  begin
    ME1DataI.Enabled := false;
    ME1DataF.Enabled := false;
  end
  else
  begin
    ME1DataI.Enabled := true;
    ME1DataF.Enabled := true;
  end;
end;

procedure TFOrdemServicoParam.RGSituacaoOrdemSinteticoClick(
  Sender: TObject);
begin
  inherited;
  // Desativa a edição dos campos data de saída das ordens para Ordens ABERTAS
  if RGSituacaoOrdemSintetico.ItemIndex = 1 then
  begin
    ME0DataI.Enabled := false;
    ME0DataF.Enabled := false;
  end
  else
  begin
    ME0DataI.Enabled := true;
    ME0DataF.Enabled := true;
  end;
end;

end.
