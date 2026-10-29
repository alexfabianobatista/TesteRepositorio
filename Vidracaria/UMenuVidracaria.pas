unit UMenuVidracaria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, Buttons, ImgList, ComCtrls;

type
  TFMenuVidracaria = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Pedido1: TMenuItem;
    NotaVenda1: TMenuItem;
    NotaaoConsumidor1: TMenuItem;
    AcompanhamentodePedidos1: TMenuItem;
    Produo1: TMenuItem;
    ImpressodeEtiquetas1: TMenuItem;
    Rastrear1: TMenuItem;
    Corte1: TMenuItem;
    Forno1: TMenuItem;
    Marcao1: TMenuItem;
    Usinagem1: TMenuItem;
    Embarque1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PeasdeRetorno1: TMenuItem;
    Laminado1: TMenuItem;
    Conferncia1: TMenuItem;
    Furao1: TMenuItem;
    Lapidao1: TMenuItem;
    Lavao1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Pedido1Click(Sender: TObject);
    procedure NotaVenda1Click(Sender: TObject);
    procedure NotaaoConsumidor1Click(Sender: TObject);
    procedure AcompanhamentodePedidos1Click(Sender: TObject);
    procedure Produo1Click(Sender: TObject);
    procedure Rastrear1Click(Sender: TObject);
    procedure Corte1Click(Sender: TObject);
    procedure Usinagem1Click(Sender: TObject);
    procedure Marcao1Click(Sender: TObject);
    procedure Forno1Click(Sender: TObject);
    procedure Embarque1Click(Sender: TObject);
    procedure ImpressodeEtiquetas1Click(Sender: TObject);
    procedure PeasdeRetorno1Click(Sender: TObject);
    procedure Laminado1Click(Sender: TObject);
    procedure Conferncia1Click(Sender: TObject);
    procedure Furao1Click(Sender: TObject);
    procedure Lapidao1Click(Sender: TObject);
    procedure Lavao1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuVidracaria: TFMenuVidracaria;

implementation

uses UPedidoCad, UTela_cl, UNotaSaidaCad, UNotaConsumidor,
  UImpressoraFiscal, ULiberaFrete, UParamSistema_cl, UDesdobramentoCad,
  UDesdobramento_ClasparCons, UNotaTransfFilialCad, ULimpezaVendas,
  UContabilidadeParam, UVenda_Regiao, UMonitorLogistica, UFidelidadeCad,
  UGuiaTransito_Cad, UItensProducaoCons, UProducaoCad, UImpressaoEtiqueta,
  URastrearCad, UProducaoCorte, UProducaoUsinagem, UProducaoMarcacao,
  UProducaoForno, UProducaoReposicao, UBaixaEstoqueLeitor,
  UAcompanhamentoReposicao, UEtiquetaImpressao, UExportar,
  UProducaoEmbarque, UPecaRetornoCad, UProducaoEmbarque1, UControleBaixa,
  UProducaoLaminado, UProducaoConferencia, UProducaoFuracao, UProducaoLapidacao,
  UProducaoLavacao;

{$R *.DFM}

procedure TFMenuVidracaria.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'VIDRACARIA';
end;

procedure TFMenuVidracaria.Pedido1Click(Sender: TObject);
begin
  inherited;
  if FPedidoCad = nil then
    FPedidoCad := TFPedidoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FPedidoCad.Caption, FPedidoCad.Name);
  FPedidoCad.ShowModal;
end;

procedure TFMenuVidracaria.NotaaoConsumidor1Click(Sender: TObject);
begin
  inherited;
  if FNotaConsumidor = nil then
    FNotaConsumidor := TFNotaConsumidor.Create(Application);
  DMTela.VerificaTela(pModulo, FNotaConsumidor.Caption, FNotaConsumidor.Name);
  FNotaConsumidor.ShowModal;
end;

procedure TFMenuVidracaria.NotaVenda1Click(Sender: TObject);
begin
  inherited;
  if FNotaSaidaCad = nil then
    FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
  DMTela.VerificaTela(pModulo, FNotaSaidaCad.Caption, FNotaSaidaCad.Name);
  FNotaSaidaCad.ShowModal;
end;

procedure TFMenuVidracaria.AcompanhamentodePedidos1Click(Sender: TObject);
begin
  inherited;
  if FItensProducaoCons = nil then
    FItensProducaoCons := TFItensProducaoCons.Create(Application);
  DMTela.VerificaTela(pModulo, FItensProducaoCons.Caption, FItensProducaoCons.Name);
  FItensProducaoCons.ShowModal;
end;

procedure TFMenuVidracaria.Produo1Click(Sender: TObject);
begin
  inherited;
  if FAcompanhamentoReposicao = nil then
    FAcompanhamentoReposicao := TFAcompanhamentoReposicao.Create(Application);
  DMTela.VerificaTela(pModulo, FAcompanhamentoReposicao.Caption, FAcompanhamentoReposicao.Name);
  FAcompanhamentoReposicao.ShowModal;
end;

procedure TFMenuVidracaria.Rastrear1Click(Sender: TObject);
begin
  inherited;  
  if FControleBaixa = nil then
    FControleBaixa := TFControleBaixa.Create(Application);
  DMTela.VerificaTela(pModulo, FControleBaixa.Caption, FControleBaixa.Name);
  FControleBaixa.ShowModal;
end;

procedure TFMenuVidracaria.Corte1Click(Sender: TObject);
begin
  inherited;
  if FProducaoCorte = nil then
    FProducaoCorte := TFProducaoCorte.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoCorte.Caption, FProducaoCorte.Name);
  FProducaoCorte.ShowModal;
end;

procedure TFMenuVidracaria.Usinagem1Click(Sender: TObject);
begin
  inherited;
  if FProducaoUsinagem = nil then
    FProducaoUsinagem := TFProducaoUsinagem.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoUsinagem.Caption, FProducaoUsinagem.Name);
  FProducaoUsinagem.ShowModal;

end;

procedure TFMenuVidracaria.Marcao1Click(Sender: TObject);
begin
  inherited;
  if FProducaoMarcacao = nil then
    FProducaoMarcacao := TFProducaoMarcacao.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoMarcacao.Caption, FProducaoMarcacao.Name);
  FProducaoMarcacao.ShowModal;
end;

procedure TFMenuVidracaria.Forno1Click(Sender: TObject);
begin
  inherited;
  if FProducaoForno = nil then
    FProducaoForno := TFProducaoForno.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoForno.Caption, FProducaoForno.Name);
  FProducaoForno.ShowModal;
end;

procedure TFMenuVidracaria.Embarque1Click(Sender: TObject);
begin
  inherited;
  //if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'VETRO' Then
  //Begin
    if FProducaoEmbarque = nil then
      FProducaoEmbarque := TFProducaoEmbarque.Create(Application);
    DMTela.VerificaTela(pModulo, FProducaoEmbarque.Caption, FProducaoEmbarque.Name);
    FProducaoEmbarque.ShowModal;
  //end;
  //if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'TEMPERMED' Then
  {Begin
    if FProducaoEmbarque1 = nil then
      FProducaoEmbarque1 := TFProducaoEmbarque1.Create(Application);
    DMTela.VerificaTela(pModulo, FProducaoEmbarque1.Caption, FProducaoEmbarque1.Name);
    FProducaoEmbarque1.ShowModal;
  End; }
end;

procedure TFMenuVidracaria.ImpressodeEtiquetas1Click(Sender: TObject);
begin
  inherited;
  if FEtiquetaImpressao = nil then
    FEtiquetaImpressao := TFEtiquetaImpressao.Create(Application);
  DMTela.VerificaTela(pModulo, FEtiquetaImpressao.Caption, FEtiquetaImpressao.Name);
  FEtiquetaImpressao.ShowModal;
end;

procedure TFMenuVidracaria.PeasdeRetorno1Click(Sender: TObject);
begin
  inherited;
  if FPecaRetornoCad = nil then
    FPecaRetornoCad := TFPecaRetornoCad.Create(Application);
  DMTela.VerificaTela(pModulo, FPecaRetornoCad.Caption, FPecaRetornoCad.Name);
  FPecaRetornoCad.ShowModal;
end;

procedure TFMenuVidracaria.Laminado1Click(Sender: TObject);
begin
  inherited;
  if FProducaoLaminado = nil then
    FProducaoLaminado := TFProducaoLaminado.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoLaminado.Caption, FProducaoLaminado.Name);
  FProducaoLaminado.ShowModal;
end;

procedure TFMenuVidracaria.Conferncia1Click(Sender: TObject);
begin
  inherited;
  if FProducaoConferencia = nil then
    FProducaoConferencia := TFProducaoConferencia.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoConferencia.Caption, FProducaoConferencia.Name);
  FProducaoConferencia.ShowModal;
end;

procedure TFMenuVidracaria.Furao1Click(Sender: TObject);
begin
  inherited;
  if FProducaoFuracao = nil then
    FProducaoFuracao := TFProducaoFuracao.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoFuracao.Caption, FProducaoFuracao.Name);
  FProducaoFuracao.ShowModal;
end;

procedure TFMenuVidracaria.Lapidao1Click(Sender: TObject);
begin
  inherited;
  if FProducaoLapidacao = nil then
    FProducaoLapidacao:= TFProducaoLapidacao.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoLapidacao.Caption,FProducaoLapidacao.Name);
  FProducaoLapidacao.ShowModal;
end;

procedure TFMenuVidracaria.Lavao1Click(Sender: TObject);
begin
  inherited;
  if FProducaoLavacao = nil then
    FProducaoLavacao:= TFProducaoLavacao.Create(Application);
  DMTela.VerificaTela(pModulo, FProducaoLavacao.Caption, FProducaoLavacao.Name);
  FProducaoLavacao.ShowModal;
end;

end.
