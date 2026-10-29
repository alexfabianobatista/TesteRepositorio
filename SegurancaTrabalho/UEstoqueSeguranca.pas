unit UEstoqueSeguranca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFEstoqueSeguranca = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DSImplantacao: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    SBImplantacao: TSpeedButton;
    SBProdutoImp: TSpeedButton;
    SBCaracteristicaImp: TSpeedButton;
    SBFilialImp: TSpeedButton;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBNImplantacao: TDBNavigator;
    TabSheet2: TTabSheet;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    SBFilialBaixa: TBitBtn;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    SBProdutoBaixa: TBitBtn;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    RGMotivo: TDBRadioGroup;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    SBCaracteristicaBaixa: TBitBtn;
    DBEdit21: TDBEdit;
    SBBaixa: TSpeedButton;
    DSBaixa: TDataSource;
    DBNBaixa: TDBNavigator;
    TabSheet4: TTabSheet;
    MEProduto: TMaskEdit;
    Label25: TLabel;
    Label26: TLabel;
    MECaracteristica: TMaskEdit;
    Label27: TLabel;
    MEFilial: TMaskEdit;
    SBProduto: TSpeedButton;
    SBCaracteristica: TSpeedButton;
    SBFilial: TSpeedButton;
    EdProduto: TEdit;
    EdCaracteristica: TEdit;
    EdFilial: TEdit;
    Label28: TLabel;
    DBEdit35: TDBEdit;
    Label29: TLabel;
    DBEdit36: TDBEdit;
    Label30: TLabel;
    DBEdit37: TDBEdit;
    Label31: TLabel;
    DBEdit38: TDBEdit;
    Label32: TLabel;
    DBEdit39: TDBEdit;
    BTBuscar: TBitBtn;
    BTConsultar: TBitBtn;
    RelaaodeBaixas1: TMenuItem;
    RelaodeMovimentaodeEstoque1: TMenuItem;
    PosEstoque1: TMenuItem;
    RelImplEstoque1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure RGMotivoChange(Sender: TObject);
    procedure SBFilialBaixaClick(Sender: TObject);
    procedure SBProdutoBaixaClick(Sender: TObject);
    procedure SBCaracteristicaBaixaClick(Sender: TObject);
    procedure SBBaixaClick(Sender: TObject);
    procedure SBImplantacaoClick(Sender: TObject);
    procedure SBProdutoImpClick(Sender: TObject);
    procedure SBCaracteristicaImpClick(Sender: TObject);
    procedure SBFilialImpClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DSBaixaStateChange(Sender: TObject);
    procedure DSImplantacaoStateChange(Sender: TObject);
    procedure SBProdutoClick(Sender: TObject);
    procedure SBCaracteristicaClick(Sender: TObject);
    procedure SBFilialClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure MECaracteristicaExit(Sender: TObject);
    procedure MEFilialExit(Sender: TObject);
    procedure BTBuscarClick(Sender: TObject);
    procedure BTConsultarClick(Sender: TObject);
    procedure RelaaodeBaixas1Click(Sender: TObject);
    procedure RelaodeMovimentaodeEstoque1Click(Sender: TObject);
    procedure PosEstoque1Click(Sender: TObject);
    procedure RelImplEstoque1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEstoqueSeguranca: TFEstoqueSeguranca;

implementation

uses UEstoqueSeguranca_cl, UFilialCons, UProdutoSegurancaCons,
  UCaracteristicaProdutoCons, UBaixaEstoqueCons, UFilial_cl,
  UProdutoSeguranca_cl, UCaracteristicaProduto_cl, UEstoqueImplantadoCons,
  UtransfEstoqueCons, UOracle_cl, UEstoqueSegurancaCons,URBaixaEstoque,
  USegurancaParam, UREstoqueSeguranca, URPosEstoque, UREstoqueImplantado;

{$R *.DFM}

procedure TFEstoqueSeguranca.FormActivate(Sender: TObject);
begin
  inherited;
  DMEstoqueSeguranca.QEstoqueImplantado.Open;
  DMEstoqueSeguranca.QBaixaEstoque.Open;
  DMEstoqueSeguranca.QTransfEstoque.Open;
end;

procedure TFEstoqueSeguranca.RGMotivoChange(Sender: TObject);
begin
  inherited;
  if RgMotivo.Itemindex = 3 then
  begin
    DBEdit19.Enabled:=True;
    Dbedit19.SetFocus
  end
  else
    DBEdit19.Enabled:=False;
end;

procedure TFEstoqueSeguranca.SBFilialBaixaClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMEstoqueSeguranca.QBaixaEstoqueCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFEstoqueSeguranca.SBProdutoBaixaClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
    DMEstoqueSeguranca.QBaixaEstoqueCod_Produto_Seguranca.Text:=DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
end;

procedure TFEstoqueSeguranca.SBCaracteristicaBaixaClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    DMEstoqueSeguranca.QBaixaEstoqueCOD_CARACTERISTICA_PRODUTO.Value:=DMCaracteristicaProduto.QCaracteristicaProdutoConsCOD_CARACTERISTICA_PRODUTO.Value;
end;

procedure TFEstoqueSeguranca.SBBaixaClick(Sender: TObject);
begin
  inherited;
  if FBaixaEstoqueCons = nil then
    FBaixaEstoqueCons := TFBaixaEstoqueCons.Create(Application);
  if FBaixaEstoqueCons.ShowModal = mrOk then
  begin
    with DMEstoqueSeguranca do
    begin
      QBaixaEstoque.Close;
      QBaixaEstoque.SetVariable('PK',QBaixaEstoqueConsCod_Baixa_Estoque.Value);
      QBaixaEstoque.Open;
    end;
  end;
end;

procedure TFEstoqueSeguranca.SBImplantacaoClick(Sender: TObject);
begin
  inherited;
  if FEstoqueImplantadoCons = nil then
    FEstoqueImplantadoCons := TFEstoqueImplantadoCons.Create(Application);
  if FEstoqueImplantadoCons.ShowModal = mrOk then
  begin
    with DMEstoqueSeguranca do
    begin
      QEstoqueImplantado.Close;
      QEstoqueImplantado.SetVariable('PK',QEstoqueImplantadoConsCod_Estoque_Implantado.Value);
      QEstoqueImplantado.Open;
    end;
  end;
end;

procedure TFEstoqueSeguranca.SBProdutoImpClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
    DMEstoqueSeguranca.QEstoqueImplantadoCod_Produto_Seguranca.Text:=DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
end;

procedure TFEstoqueSeguranca.SBCaracteristicaImpClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    DMEstoqueSeguranca.QEstoqueImplantadoCOD_CARACTERISTICA_PRODUTO.Value:=DMCaracteristicaProduto.QCaracteristicaProdutoConsCOD_CARACTERISTICA_PRODUTO.Value;
end;

procedure TFEstoqueSeguranca.SBFilialImpClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    DMEstoqueSeguranca.QEstoqueImplantadoCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFEstoqueSeguranca.DSPrimarioStateChange(Sender: TObject);
begin
//  inherited;

end;

procedure TFEstoqueSeguranca.DSBaixaStateChange(Sender: TObject);
begin
  inherited;
  if DSBaixa.State in [DSInsert,DSEdit] then
  begin
    SBBaixa.Enabled:=False;
    SBProdutoBaixa.Enabled:=True;
    SBFilialBaixa.Enabled:=True;
    SBCaracteristicaBaixa.Enabled:=True;
  end
  else
  begin
    SBBaixa.Enabled:=True;
    SBFilialBaixa.Enabled:=false;
    SBProdutoBaixa.Enabled:=false;
    SBCaracteristicaBaixa.Enabled:=False;
  end;
end;

procedure TFEstoqueSeguranca.DSImplantacaoStateChange(Sender: TObject);
begin
  inherited;
  if DSImplantacao.State in [DSInsert,DSEdit] then
  begin
    SBImplantacao.Enabled:=False;
    SBProdutoImp.Enabled:=True;
    SBFilialImp.Enabled:=True;
    SBCaracteristicaImp.Enabled:=True;
  end
  else
  begin
    SBImplantacao.Enabled:=True;
    SBFilialImp.Enabled:=false;
    SBProdutoImp.Enabled:=false;
    SBCaracteristicaImp.Enabled:=False;
  end;
end;

procedure TFEstoqueSeguranca.SBProdutoClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
    MEProduto.Text:=DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  MEProdutoExit(Self);
end;

procedure TFEstoqueSeguranca.SBCaracteristicaClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
    MECaracteristica.Text:=DMCaracteristicaProduto.QCaracteristicaProdutoConsCOD_CARACTERISTICA_PRODUTO.Text;
  MECaracteristicaExit(Self);
end;

procedure TFEstoqueSeguranca.SBFilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
    MEFilial.Text:=DMFilial.QFilialConsCod_Filial.Text;
  MEFilialExit(Self);
end;

procedure TFEstoqueSeguranca.MEProdutoExit(Sender: TObject);
begin
  inherited;
  if Trim(MEProduto.Text) <> '' then
    EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO_SEGURANCA FROM TB_PRODUTO_SEGURANCA',
                                         'COD_PRODUTO_SEGURANCA = '+Trim(MEProduto.Text))
  else
    EdProduto.Text := '';
end;

procedure TFEstoqueSeguranca.MECaracteristicaExit(Sender: TObject);
begin
  inherited;
  if Trim(MECaracteristica.Text) <> '' then
    EdCaracteristica.Text := DMOracle.BuscaNome('SELECT DESC_CARACTERISTICA_PRODUTO FROM TB_CARACTERISTICA_PRODUTO',
                                                'COD_CARACTERISTICA_PRODUTO = '+Trim(MECaracteristica.Text))
  else
    EdCaracteristica.Text := '';
end;

procedure TFEstoqueSeguranca.MEFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MEFilial.Text) <> '' then
    EdFilial.Text := DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL',
                                        'COD_FILIAL = '+Trim(MEFilial.Text))
  else
    EdFilial.Text := '';
end;

procedure TFEstoqueSeguranca.BTBuscarClick(Sender: TObject);
begin
  inherited;
  if (Trim(MEProduto.Text)<>'') and (Trim(MECaracteristica.Text)<>'') and (Trim(MEFilial.Text)<>'') then
  begin
    with DMEstoqueSeguranca do
    begin
      QEstoqueAtual.Close;
      QEstoqueAtual.SetVariable('PRODUTO_SEGURANCA',Trim(MEProduto.Text));
      QEstoqueAtual.SetVariable('CARACTERISTICA_PRODUTO',Trim(MECaracteristica.Text));
      QEstoqueAtual.SetVariable('FILIAL',Trim(MEFilial.Text));
      QEstoqueAtual.Open;
    end;
  end
  else
    Raise Exception.Create('Campo obrigatório não preenchido - preencha todos os campos do formulário');
end;

procedure TFEstoqueSeguranca.BTConsultarClick(Sender: TObject);
begin
  inherited;
  if FEstoqueSegurancaCons = nil then
    FEstoqueSegurancaCons := TFEstoqueSegurancaCons.Create(Application);
  if FEstoqueSegurancaCons.ShowModal = mrOk then
  begin
    with DMEstoqueSeguranca do
    begin
      MEProduto.Text := QEstoqueSegurancaConsCOD_PRODUTO_SEGURANCA.Text;
      EdProduto.Text := QEstoqueSegurancaConsDESC_PRODUTO_SEGURANCA.Text;
      MECaracteristica.Text := QEstoqueSegurancaConsCOD_CARACTERISTICA_PRODUTO.Text;
      EdCaracteristica.Text := QEstoqueSegurancaConsDESC_CARACTERISTICA_PRODUTO.Text;
      MEFilial.Text := QEstoqueSegurancaConsCOD_FILIAL.Text;
      EdFilial.Text := QEstoqueSegurancaConsDESC_FILIAL.Text;
    end;
    BTBuscarClick(Self);
  end;
end;

procedure TFEstoqueSeguranca.RelaaodeBaixas1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[8].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMEstoqueSeguranca do
  begin
    QRBaixaEstoque.Close;

    if(Trim(FSegurancaParam.ME9Filial.Text)<> '') then
      QRBaixaEstoque.SetVariable('FILIAL',StrToInt(Trim(FSegurancaParam.ME9Filial.Text)))
    else
      QRBaixaEstoque.SetVariable('FILIAL',Null);

    if Trim(FSegurancaParam.ME9Produto.Text) <> '' then
      QRBaixaEstoque.SetVariable('PRODUTO',StrToInt(Trim(FSegurancaParam.ME9Produto.Text)))
    else
      QRBaixaEstoque.SetVariable('PRODUTO',Null);

    if Trim(FSegurancaParam.ME9DtInicial.Text) <> '' then
      QRBaixaEstoque.SetVariable('DT_INICIAL',(Trim(FSegurancaParam.Me9DtInicial.Text)))
    else
      Raise Exception.Create('É preciso informar a data inicial');

    if Trim(FSegurancaParam.ME9DtFinal.Text) = '' then
      FSegurancaParam.ME9DtFinal.Text := DateToStr(Date);
    QRBaixaEstoque.SetVariable('DT_FINAL',(Trim(FSegurancaParam.Me9DtFinal.Text)));

    QRBaixaEstoque.Open;

    if FRBaixaEstoque = nil then
      FRBaixaEstoque := TFRBaixaEstoque.Create(Application);
    FRBaixaEstoque.QRLFilial.Caption :='Filial: '+FSegurancaParam.Ed9Filial.Text;
    FRBaixaEstoque.QRLTitulo.Caption := 'Relação de Baixas de Estoque no Período de '+Trim(FSegurancaParam.ME9DtInicial.Text)+' Até '+Trim(FSegurancaParam.ME9DtFinal.Text);
    if FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRBaixaEstoque.QRPrimario.Preview
    else
      FRBaixaEstoque.QRPrimario.print;
    QRBaixaEstoque.Close;
  end;
end;

procedure TFEstoqueSeguranca.RelaodeMovimentaodeEstoque1Click(
  Sender: TObject);
begin
  inherited;
  if FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[9].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMEstoqueSeguranca do
  begin
    QREstoqueSeguranca.Close;

    if(Trim(FSegurancaParam.ME10Filial.Text)<> '') then
      QREstoqueSeguranca.SetVariable('COD_FILIAL',StrToInt(Trim(FSegurancaParam.ME10Filial.Text)))
    else
      QREstoqueSeguranca.SetVariable('COD_FILIAL',Null);

    if Trim(FSegurancaParam.ME10Produto.Text) <> '' then
      QREstoqueSeguranca.SetVariable('COD_PRODUTO',StrToInt(Trim(FSegurancaParam.ME10Produto.Text)))
    else
      QREstoqueSeguranca.SetVariable('COD_PRODUTO',Null);

    QREstoqueSeguranca.Open;

    if FREstoqueSeguranca = nil then
      FREstoqueSeguranca := TFREstoqueSeguranca.Create(Application);
    FREstoqueSeguranca.QRLFilial.Caption :='Filial: '+FSegurancaParam.Ed10Filial.Text;

    if FSegurancaParam.RGPreview.ItemIndex = 0 then
      FREstoqueSeguranca.QRPrimario.Preview
    else
      FREstoqueSeguranca.QRPrimario.print;
    FREstoqueSeguranca.Close;
  end;
end;

procedure TFEstoqueSeguranca.PosEstoque1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[10].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMEstoqueSeguranca do
  begin
    QRPosEstoque.Close;

    if(Trim(FSegurancaParam.ME11Filial.Text)<> '') then
      QRPosEstoque.SetVariable('COD_FILIAL',StrToInt(Trim(FSegurancaParam.ME11Filial.Text)))
    else
      QRPosEstoque.SetVariable('COD_FILIAL',Null);

    if Trim(FSegurancaParam.ME11Produto.Text) <> '' then
      QRPosEstoque.SetVariable('COD_PRODUTO',StrToInt(Trim(FSegurancaParam.ME11Produto.Text)))
    else
      QRPosEstoque.SetVariable('COD_PRODUTO',Null);

    QRPosEstoque.Open;

    if FRPosEstoque = nil then
      FRPosEstoque := TFRPosEstoque.Create(Application);
    FRPosEstoque.QRLFilial.Caption :='Filial: '+FSegurancaParam.Ed11Filial.Text;

    if FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRPosEstoque.QRPrimario.Preview
    else
      FRPosEstoque.QRPrimario.print;
    FRPosEstoque.Close;
  end;
end;

procedure TFEstoqueSeguranca.RelImplEstoque1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[11].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMEstoqueSeguranca do
  begin
    QREstoqueImplantado.Close;

    if Trim(FSegurancaParam.ME12DtInicio.Text) <> '' then
      QREstoqueImplantado.SetVariable('DATA_I',Trim(FSegurancaParam.ME12DtInicio.Text))
    else
      Raise Exception.Create('É preciso informar a data inicial');

    if Trim(FSegurancaParam.ME12DtFim.Text) = '' then
      FSegurancaParam.ME12DtFim.Text := DateToStr(Date);
    QREstoqueImplantado.SetVariable('DATA_F',Trim(FSegurancaParam.ME12DtFim.Text));

    if(Trim(FSegurancaParam.ME12Filial.Text)<> '') then
      QREstoqueImplantado.SetVariable('FILIAL',Trim(FSegurancaParam.ME12Filial.Text))
    else
      QREstoqueImplantado.SetVariable('FILIAL',Null);

    if Trim(FSegurancaParam.ME12Produto.Text) <> '' then
      QREstoqueImplantado.SetVariable('PRODUTO',Trim(FSegurancaParam.ME12Produto.Text))
    else
      QREstoqueImplantado.SetVariable('PRODUTO',Null);

    QREstoqueImplantado.Open;

    if FREstoqueImplantado = nil then
      FREstoqueImplantado := TFREstoqueImplantado.Create(Application);
    FREstoqueImplantado.QRLFilial.Caption :='Filial: '+FSegurancaParam.Ed12Filial.Text;
    FREstoqueImplantado.QRLTitulo.Caption := 'Relação de Implantação de Estoque de Material de Segurança no Período de '+
                                             Trim(FSegurancaParam.ME12DtInicio.Text)+
                                             ' Até '+Trim(FSegurancaParam.ME12DtFim.Text);
    if FSegurancaParam.RGPreview.ItemIndex = 0 then
    begin
      FREstoqueImplantado.QRPrimario.Preview;
    end
    else
      FREstoqueImplantado.QRPrimario.print;
    QREstoqueImplantado.Close;
  end;
end;

procedure TFEstoqueSeguranca.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(12);
end;

end.
