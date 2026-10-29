unit UControleEntregaCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls, UFmCadastro, Grids, DBGrids, UFmFilial, jpeg,
  PngImage;

type
  TFControleEntregaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DSEntregaItem: TDataSource;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    DBEdit20: TDBEdit;
    DBGrid1: TDBGrid;
    EdCidade: TEdit;
    FmFilial1: TFmFilial;
    RgSituacao: TRadioGroup;
    EdObsEntrega: TEdit;
    EdObsEntregador: TEdit;
    EdEndereco: TEdit;
    MEDtAlteracao: TMaskEdit;
    MEDtEntrega: TMaskEdit;
    MEDtEntregaPrevista: TMaskEdit;
    MEDtCriacao: TMaskEdit;
    EdCodCidade: TEdit;
    EdBairro: TEdit;
    EdCep: TEdit;
    Label3: TLabel;
    EdComplementoEndereco: TEdit;
    FmEntregador: TFmCadastro;
    Label2: TLabel;
    EdEstado: TEdit;
    ImgEntrega: TImage;
    EntregasporEntregador1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure FmEntregadorBtCadastroClick(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure SBExcluirClick(Sender: TObject);
    procedure LimpaCampos(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure EntregasporEntregador1Click(Sender: TObject);
    procedure MELocalizaExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AtualizarImagemEntrega;
    procedure CarregarImagemPNG;
  public
    { Public declarations }
  end;

var
  FControleEntregaCad: TFControleEntregaCad;

implementation

uses UPedido_cl, UPedidoCons, UUsuario_cl, UOracle_cl, DateUtils, UTela_cl, UREntregaEntregador,
     UCadastroCons, UCadastro_cl, UEntregaCons, UBiblioteca, UControleEntregaParam;

{$R *.dfm}

procedure TFControleEntregaCad.FormActivate(Sender: TObject);
begin
  inherited;
  TPicture.RegisterFileFormat('PNG', 'Portable Network Graphics', TPNGObject);
  with DMPedido do
  begin
    QEntrega.Open;
    QEntregaItem.Open;
  end;
  MELocaliza.SetFocus;
end;

procedure TFControleEntregaCad.SBIncluirClick(Sender: TObject);
var
 wDesc_endereco, wDesc_CEP, wDesc_Bairro, wCodNota: string;
begin
  inherited;
  LimpaCampos(Sender);
  with DMPedido, DMUsuario do
  begin
    FmEntregador.MeCadastro.Text := QUsuarioCOD_ENTREGADOR_PADRAO.Text;
    FmEntregador.MeCadastroExit(Sender);
    QEntregaCOD_ENTREGADOR.Text := Trim(FmEntregador.MeCadastro.Text);
    FmFilial1.MeFilial.Text := QUsuarioCOD_FILIAL.Text;
    FmFilial1.MeFilialExit(Sender);
    QEntregaCOD_FILIAL.Text := Trim(FmFilial1.MeFilial.Text);
    QEntregaDT_CRIACAO.Text := DateToStr(Now);
    QEntregaDT_ULT_ALTERACAO.Text := DateToStr(Now);

    if FPedidoCons = nil then
      FPedidoCons := TFPedidoCons.Create(Application);
    if FPedidoCons.ShowModal = mrOk then
    begin
      ValidaEntrega(QPedidoConsCOD_PEDIDO_CAB.Text);
      FmFilial1.MeFilial.Text := QPedidoConsCOD_FILIAL.Text;
      FmFilial1.MeFilialExit(Sender);
      QEntregaCOD_FILIAL.Text := Trim(FmFilial1.MeFilial.Text);
      if QPedidoConsDT_ENTREGA_PRORROGADA.Text <> '' then
        MEDtEntregaPrevista.Text := QPedidoConsDT_ENTREGA_PRORROGADA.Text
      else
        MEDtEntregaPrevista.Text := DateToStr(Now);
      QEntregaItemCOD_ENTREGA_ITEM.Text := DMOracle.BuscaNome('SELECT SQENTREGA_ITEM.NEXTVAL FROM DUAL', '1=1');
      QEntregaItemCOD_ENTREGA_CAB.Text := DBEdit1.Text;
      EdBairro.Text := DMOracle.FastSelect('DESC_BAIRRO','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      EdEndereco.Text := DMOracle.FastSelect('DESC_ENDERECO','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      EdComplementoEndereco.Text := DMOracle.FastSelect('DESC_COMPLEMENTO','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      EdCodCidade.Text  := DMOracle.FastSelect('COD_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      EdCidade.Text := DMOracle.FastSelect('DESC_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      EdEstado.Text := DMOracle.FastSelect('COD_ESTADO','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      EdCep.Text := DMOracle.FastSelect('DESC_CEP','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      MEDtCriacao.Text := DateToStr(Now);
      MEDtAlteracao.Text := DateToStr(Now);
      DBEdit8.Text := QPedidoConsCOD_PEDIDO_CAB.Text;
{Removido pois estava apresentando erro na tela do aplicativo, pois o app busca ou por CodNota ou CodPedido, quando tem os 2 campos gravados não localiza a
entrega. Alex 15/05/2025
      wCodNota := DMOracle.FastSelect('COD_NOTA_CAB','TB_NOTA_CAB','NUM_PEDIDO = ' + QPedidoConsNUM_PEDIDO.Text);
      if wCodNota <> '' then
        DBEdit7.Text := wCodNota;}
      EdCidade.Text := DMOracle.FastSelect('DESC_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + QPedidoConsCOD_CADASTRO.Text);
      RgSituacao.ItemIndex := 0;
      FmFilial1.MeFilial.SetFocus;
    end;
  end;
end;

procedure TFControleEntregaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEntregaCons = nil then
    FEntregaCons :=TFEntregaCons.Create(Application);
  if FEntregaCons.ShowModal = mrOk then
  begin
    with DMPedido do
    begin
      QEntrega.Close;
      QEntrega.SetVariable('PK',QEntregaConsCOD_ENTREGA_CAB.Value);
      QEntrega.Open;
      FmEntregador.MeCadastro.Text := QEntregaConsCOD_ENTREGADOR.Text;
      FmEntregador.MeCadastroExit(Sender);
      FmFilial1.MeFilial.Text := QEntregaConsCOD_FILIAL.Text;
      FmFilial1.MeFilialExit(Sender);
      QEntregaCOD_ENTREGADOR.Text := QEntregaConsCOD_ENTREGADOR.Text;
      EdEndereco.Text := QEntregaConsDESC_ENDERECO.Text;
      EdBairro.Text := QEntregaConsDESC_BAIRRO.Text;
      EdCep.Text := QEntregaConsDESC_CEP.Text;
      EdCodCidade.Text := QEntregaConsCOD_CIDADE.Text;
      EdCidade.Text := DMOracle.FastSelect('DESC_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
      EdEstado.Text := DMOracle.FastSelect('COD_ESTADO','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
      EdComplementoEndereco.Text := QEntregaConsDESC_COMPLEMENTO.Text;
      EdObsEntrega.Text := QEntregaConsDESC_OBS_ENTREGA.Text;
      EdObsEntregador.Text := QEntregaConsDESC_OBS_ENTREGADOR.Text;
      MEDtAlteracao.Text := QEntregaConsDT_ALTERACAO_ITEM.Text;
      MEDtEntregaPrevista.Text := QEntregaConsDT_ENTREGA_PREV.Text;
      if QEntregaConsDT_ENTREGA.Text <> '' then
        MEDtEntrega.Text := QEntregaConsDT_ENTREGA.Text
      else
       MEDtEntrega.Text := '';
      MEDtCriacao.Text := QEntregaConsDT_CRIACAO_ITEM.Text;
{Removido pois estava apresentando erro na tela do aplicativo, pois o app busca ou por CodNota ou CodPedido, quando tem os 2 campos gravados não localiza a
entrega. Alex 15/05/2025
      DBEdit7.Text := QEntregaConsCOD_NOTA_CAB.Text;}
      if QEntregaConsIND_SITUACAO.Value = 'P' then
        RgSituacao.ItemIndex := 0;
      if QEntregaConsIND_SITUACAO.Value = 'C' then
        RgSituacao.ItemIndex := 1;
      if QEntregaConsIND_SITUACAO.Value = 'E' then
        RgSituacao.ItemIndex := 2;
      if QEntregaConsIND_SITUACAO.Value = 'R' then
        RgSituacao.ItemIndex := 3;
      QEntregaImagem.Close;
      QEntregaImagem.Open;
      QEntregaImagem.SetVariable('COD_ENTREGA_ITEM',QEntregaItemCOD_ENTREGA_ITEM.Value);
      QEntregaImagem.Open;
    end;
  end;
end;

procedure TFControleEntregaCad.SBAlterarClick(Sender: TObject);
begin
  inherited;
  with DMPedido, DMUsuario do
  begin
    QEntregaCOD_ENTREGADOR.Text := Trim(FmEntregador.MeCadastro.Text);
    FmEntregador.MeCadastroExit(Sender);
    QEntregaCOD_ENTREGADOR.Text := Trim(FmEntregador.MeCadastro.Text);
    if (Trim(FmFilial1.MeFilial.Text) = '' ) then
    begin
      FmFilial1.MeFilial.Text := QUsuarioCOD_FILIAL.Text;
      FmFilial1.MeFilialExit(Sender);
    end;
    QEntregaCOD_FILIAL.Text := Trim(FmFilial1.MeFilial.Text);
    QEntregaDT_CRIACAO.Text := DateToStr(Now);
    QEntregaDT_ULT_ALTERACAO.Text := DateToStr(Now);
    EdBairro.Text := DMOracle.FastSelect('DESC_BAIRRO','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
    EdEndereco.Text := DMOracle.FastSelect('DESC_ENDERECO','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
    EdEstado.Text := DMOracle.FastSelect('COD_ESTADO','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
    EdComplementoEndereco.Text := DMOracle.FastSelect('DESC_COMPLEMENTO','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
    EdCodCidade.Text  := DMOracle.FastSelect('COD_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
    EdCidade.Text := DMOracle.FastSelect('DESC_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
    EdCep.Text := DMOracle.FastSelect('DESC_CEP','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
    MEDtCriacao.Text := DateToStr(Now);
    MEDtAlteracao.Text := DateToStr(Now);
    FmFilial1.MeFilial.SetFocus;
  end;
end;

procedure TFControleEntregaCad.SBConfirmarClick(Sender: TObject);
var
 wDesc_endereco, wDesc_CEP, wDesc_Bairro, wCodNota: string;
begin
  with DMPedido, DMUsuario do
  begin
{Grava cabeçalho da entrega}
    if not (QEntrega.State in [dsEdit, dsInsert]) then
      QEntrega.Edit;
    QEntregaCOD_ENTREGADOR.Text := Trim(FmEntregador.MeCadastro.Text);
    FmEntregador.MeCadastroExit(Sender);
    QEntregaCOD_ENTREGADOR.Text := Trim(FmEntregador.MeCadastro.Text);
    if (Trim(FmFilial1.MeFilial.Text) = '' ) then
    begin
      FmFilial1.MeFilial.Text := QUsuarioCOD_FILIAL.Text;
      FmFilial1.MeFilialExit(Sender);
    end;
    QEntregaCOD_FILIAL.Text := Trim(FmFilial1.MeFilial.Text);
    QEntrega.Post;
{Fim Cabeçalho e inicia item}    
    if not (QEntregaItem.State in [dsEdit, dsInsert]) then
      QEntregaItem.Edit;
    QEntregaItemCOD_ENTREGA_CAB.Text := DBEdit1.Text;
    QEntregaItemDESC_ENDERECO.Text := EdEndereco.Text;
    QEntregaItemDESC_COMPLEMENTO.Text := EdComplementoEndereco.Text;
    QEntregaItemDESC_BAIRRO.Text := EdBairro.Text;
    QEntregaItemCOD_CIDADE.Text := trim(EdCodCidade.Text);
    QEntregaItemDESC_CEP.Text := Trim(EdCep.Text);
    QEntregaItemDT_CRIACAO.Text := MEDtCriacao.Text;
    QEntregaItemDT_ULT_ALTERACAO.Text := DateToStr(Now);
    if QPedidoConsDT_ENTREGA.Text <> '' then
    begin
      QEntregaItemDT_ENTREGA_PREV.Text := QPedidoConsDT_ENTREGA.Text;
      QEntregaItemDT_ENTREGA.Text := QPedidoConsDT_ENTREGA.Text;
    end
    else
    begin
      QEntregaItemDT_ENTREGA_PREV.Text := DateToStr(Now);
      QEntregaItemDT_ENTREGA.Text := '';
    end;
    if (DBEdit8.Text = '') then
      QEntregaItemCOD_PEDIDO_CAB.Text := QPedidoConsCOD_PEDIDO_CAB.Text;
{Removido pois estava apresentando erro na tela do aplicativo, pois o app busca ou por CodNota ou CodPedido, quando tem os 2 campos gravados não localiza a
entrega. Alex 15/05/2025
    if QPedidoConsNUM_PEDIDO.Text <> '' then
      wCodNota := DMOracle.FastSelect('COD_NOTA_CAB','TB_NOTA_CAB','NUM_PEDIDO = ' + QPedidoConsNUM_PEDIDO.Text);
    if wCodNota <> '' then
      QEntregaItemCOD_NOTA_CAB.Text := wCodNota;}
    QEntregaItemDESC_OBS_ENTREGA.Text := EdObsEntrega.Text;
    QEntregaItemDESC_OBS_ENTREGADOR.Text := EdObsEntregador.Text;
    if RgSituacao.ItemIndex = 0 then
      QEntregaItemIND_SITUACAO.Value := 'P';
    if RgSituacao.ItemIndex = 1 then
      QEntregaItemIND_SITUACAO.Value := 'C';
    if (RgSituacao.ItemIndex = 2) or (RgSituacao.ItemIndex = 3) then
    begin
      ShowMessage('Situação não permitida! É possível apenas Cancelar ou Marcar como Pendente uma entrega.');
      RgSituacao.ItemIndex := 0;
      Abort;
    end;
    QEntregaItem.Post;
{Fim entrega item}
    FmFilial1.MeFilial.SetFocus;
  end;
end;

procedure TFControleEntregaCad.FmEntregadorBtCadastroClick(
  Sender: TObject);
var
  wTipoCadastro : String;
begin
  inherited;
  wTipoCadastro := DMOracle.FastSelect('COD_TIPO_CADASTRO','TB_TIPO_CADASTRO','DESC_TIPO_CADASTRO = ' + chr(39) + 'ENTREGADOR' + chr(39) );
  if FCadastroCons = Nil then
  begin
    FCadastroCons := TFCadastroCons.Create(Application);
    FCadastroCons.METipoCadastro.Text := wTipoCadastro;
  end;
  FCadastroCons.METipoCadastro.Text := wTipoCadastro;
  if FCadastroCons.ShowModal = mrOk then
  begin
    FCadastroCons.METipoCadastro.Text := wTipoCadastro;
    FmEntregador.MeCadastro.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    FmEntregador.MeCadastroExit(Sender);
  end;
end;

procedure TFControleEntregaCad.AtualizarImagemEntrega;
var
  b: TStream;
  Jpg: TJpegImage;
begin
  Jpg := nil;

  // transferindo a fotografia para o objeto TStream
  b := DMPedido.QEntregaImagem.CreateBlobStream(DMPedido.QEntregaImagemIMG_ENTREGA, bmRead);

  // se o registro não possui fotografia então apagaremos a imagem
  // atual dentro do TImage, senão vai parecer que a fotografia seguinte
  // será igual a anterior
  if b.Size > 0 then
  begin
    // aqui ta o problema, como recuperar o jpeg do banco
    // perceba que a variavel 'Jpg' é do tipo TJpegImage que por sua vez é uma classe TGraphic
    // e que portanto poderá ser assinalada a propriedade Image1.Picure[.Graphic]
    try
      Jpg := TJpegImage.Create;
      Jpg.LoadFromStream(b);
      imgEntrega.Picture.Assign(Jpg);
      imgEntrega.visible := true;
    except
    end;
  end
  else
  begin
    // Essa seria a maneira natural de eliminar um desenho dentro do
    // TImage, pois se fizessemos um Image1.Picture.Graphic:=nil como
    // sugerem alguns exemplos na internet, provocariamos um 'access violation',
    // pois um nulo não pode ser tratado como bitmap ou jpeg.
    imgEntrega.Picture.Assign(nil);
    imgEntrega.Visible := false;
  end;

//  lblImagemNaoCadastrada.Visible := not imgProduto.Visible; //se a imagem está visível esconde o label, se nao mostra o label

  // Vamos liberar um pouco de memória
  jpg.Free;
  b.Destroy;
end;

procedure TFControleEntregaCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DMPedido do
  begin
    QEntregaImagem.Close;
    QEntregaImagem.SetVariable('COD_ENTREGA_ITEM', DMPedido.QEntregaItemCOD_ENTREGA_ITEM.Value);
    QEntregaImagem.Open;
//    AtualizarImagemEntrega;
    CarregarImagemPNG;
  end;
end;

procedure TFControleEntregaCad.SBExcluirClick(Sender: TObject);
begin
  DMPedido.ExcluiEntrega;
  LimpaCampos(Sender);
end;

Procedure TFControleEntregaCad.LimpaCampos(Sender: TObject);
begin
  FmFilial1.MeFilial.Text := '';
  FmFilial1.EdFilial.Text := '';
  FmEntregador.MeCadastro.Text := '';
  FmEntregador.EdCadastro.Text := '';
  EdEndereco.Text := '';
  EdBairro.Text := '';
  EdCidade.Text := '';
  EdComplementoEndereco.Text := '';
  EdCodCidade.Text := '';
  EdEstado.Text := '';
  EdObsEntrega.Text := '';
  EdObsEntregador.Text := '';
  MEDtAlteracao.Text := '';
  MEDtEntrega.Text := '';
  MEDtEntregaPrevista.Text := '';
  MEDtCriacao.Text := '';
  MELocaliza.Text := '';
  CarregarImagemPNG;
end;

procedure TFControleEntregaCad.SBCancelarClick(Sender: TObject);
begin
  inherited;
  LimpaCampos(Sender);
end;

procedure TFControleEntregaCad.EntregasporEntregador1Click(
  Sender: TObject);
var
  wSituacao, wDescricao: string;
begin
  inherited;
  if FControleEntregaParam = nil then
    FControleEntregaParam := TFControleEntregaParam.Create(Application);
  FControleEntregaParam.PGRelatorio.Pages[0].TabVisible := True;

  if FControleEntregaParam.ShowModal = mrOk then
  with DMPedido do
  begin
    QREntregaEntregador.Close;
    if trim(FControleEntregaParam.FmFilial1.MeFilial.Text)  = '' then
      QREntregaEntregador.SetVariable('COD_FILIAL', Null)
    else
      QREntregaEntregador.SetVariable('COD_FILIAL', StrToInt(trim(FControleEntregaParam.FmFilial1.MeFilial.Text))) ;

    if Trim(FControleEntregaParam.FmCadastro1.MeCadastro.Text) = '' then
      QREntregaEntregador.SetVariable('COD_CADASTRO', Null)
    else
      QREntregaEntregador.SetVariable('COD_CADASTRO', StrToInt(Trim(FControleEntregaParam.FmCadastro1.MeCadastro.Text)));

    if (FControleEntregaParam.Me1DtEmissaoFinal.Text = '') then
      QREntregaEntregador.SetVariable('DT_EMISSAO_INI', Null)
    else
      QREntregaEntregador.SetVariable('DT_EMISSAO_INI', FControleEntregaParam.Me1DtEmissaoInicial.Text);

    if (FControleEntregaParam.Me1DtEmissaoFinal.Text = '') then
      QREntregaEntregador.SetVariable('DT_EMISSAO_FIM', Null)
    else
      QREntregaEntregador.SetVariable('DT_EMISSAO_FIM', FControleEntregaParam.Me1DtEmissaoFinal.Text);

    if (FControleEntregaParam.Me1DtEntregaInicial.Text = '') then
      QREntregaEntregador.SetVariable('DT_ENTREGA_INI', Null)
    else
      QREntregaEntregador.SetVariable('DT_ENTREGA_INI', FControleEntregaParam.Me1DtEntregaInicial.Text);

    if (FControleEntregaParam.Me1DtEntregaFinal.Text = '') then
      QREntregaEntregador.SetVariable('DT_ENTREGA_FIM', Null)
    else
      QREntregaEntregador.SetVariable('DT_ENTREGA_FIM', FControleEntregaParam.Me1DtEntregaFinal.Text);

    case FControleEntregaParam.RG1Situacao.ItemIndex of
      0:
      begin
        wSituacao := 'P';
        wDescricao := 'Pendentes';
        QREntregaEntregador.SetVariable('SITUACAO',wSituacao);
      end;
      1:
      begin
        wSituacao := 'C';
        wDescricao := 'Canceladas';
        QREntregaEntregador.SetVariable('SITUACAO',wSituacao);
      end;
      2:
      begin
        wSituacao := 'E';
        wDescricao := 'Entregues';
        QREntregaEntregador.SetVariable('SITUACAO',wSituacao);
      end;
      3:
      begin
        wSituacao := 'R';
        wDescricao := 'Recusada';
        QREntregaEntregador.SetVariable('SITUACAO',wSituacao);
      end;
      4:
      begin
        wDescricao := 'Todas';
        QREntregaEntregador.SetVariable('SITUACAO',Null);
      end;
    end;

    QREntregaEntregador.Open;
    if FREntregaEntregador = nil then
      FREntregaEntregador := TFREntregaEntregador.Create(Application);

    FREntregaEntregador.QRLEmpresa.Caption := DMOracle.FastSelect('DESC_EMPRESA', 'TB_PARAM_SISTEMA');

    if (FControleEntregaParam.Me1DtEmissaoInicial.Text <> '' ) or (FControleEntregaParam.Me1DtEmissaoFinal.Text <> '') then
      FREntregaEntregador.QRLTitulo.Caption := 'Relatório das Entregas por Entregador no Período de: (' + FControleEntregaParam.Me1DtEmissaoInicial.Text + ' - ' +
                                                FControleEntregaParam.Me1DtEmissaoFinal.Text + ')' + ' Situação das Entregas: ' + wDescricao;

    if (FControleEntregaParam.Me1DtEntregaInicial.Text <> '' ) or (FControleEntregaParam.Me1DtEntregaFinal.Text <> '') then
      FREntregaEntregador.QRLTitulo.Caption := 'Relatório das Entregas por Entregador no Período de: (' + FControleEntregaParam.Me1DtEntregaInicial.Text + ' - ' +
                                                FControleEntregaParam.Me1DtEntregaFinal.Text + ')' + ' Situação das Entregas: ' + wDescricao;

    if (FControleEntregaParam.Me1DtEmissaoInicial.Text = '' )    or  (FControleEntregaParam.Me1DtEmissaoFinal.Text = '') or
       (FControleEntregaParam.Me1DtEntregaInicial.Text = '' )    or  (FControleEntregaParam.Me1DtEntregaFinal.Text = '') then
      FREntregaEntregador.QRLTitulo.Caption := 'Relatório das Entregas por Entregador - ' + ' Situação das Entregas: ' + wDescricao;


    if FControleEntregaParam.RGPreview.ItemIndex = 0 then
      FREntregaEntregador.QRPrimario.Preview
    else
      FREntregaEntregador.QRPrimario.Print;
    QREntregaEntregador.Close;
  end;

end;

procedure TFControleEntregaCad.MELocalizaExit(Sender: TObject);
begin
  with DMPedido do
  begin
    if Trim(MELocaliza.Text) <> '' then
    begin
      QEntregaCons.Close;
      QEntregaCons.SetVariable(':COD_ENTREGA_CAB',trim(MELocaliza.Text));//QEntregaConsCOD_ENTREGA_CAB.Value);
      QEntregaCons.Open;
      QEntrega.Close;
      QEntrega.SetVariable('PK',QEntregaConsCOD_ENTREGA_CAB.Value);
      QEntrega.Open;
      if QEntregaConsCOD_ENTREGA_CAB.Text <> '' then
      begin
        DBEdit1.Text := QEntregaConsCOD_ENTREGA_CAB.Text;
        QEntregaCOD_ENTREGA_CAB.Text := QEntregaConsCOD_ENTREGA_CAB.Text;
        FmEntregador.MeCadastro.Text := QEntregaConsCOD_ENTREGADOR.Text;
        FmEntregador.MeCadastroExit(Sender);
        FmFilial1.MeFilial.Text := QEntregaConsCOD_FILIAL.Text;
        FmFilial1.MeFilialExit(Sender);
        QEntregaCOD_ENTREGADOR.Text := QEntregaConsCOD_ENTREGADOR.Text;
        EdEndereco.Text := QEntregaConsDESC_ENDERECO.Text;
        EdBairro.Text := QEntregaConsDESC_BAIRRO.Text;
        EdCep.Text := QEntregaConsDESC_CEP.Text;
        EdCodCidade.Text := QEntregaConsCOD_CIDADE.Text;
        EdCidade.Text := DMOracle.FastSelect('DESC_CIDADE','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
        EdEstado.Text := DMOracle.FastSelect('COD_ESTADO','TB_CADASTRO','COD_CADASTRO = ' + QEntregaConsCOD_CADASTRO.Text);
        EdComplementoEndereco.Text := QEntregaConsDESC_COMPLEMENTO.Text;
        EdObsEntrega.Text := QEntregaConsDESC_OBS_ENTREGA.Text;
        EdObsEntregador.Text := QEntregaConsDESC_OBS_ENTREGADOR.Text;
        MEDtAlteracao.Text := QEntregaConsDT_ALTERACAO_ITEM.Text;
        MEDtEntregaPrevista.Text := QEntregaConsDT_ENTREGA_PREV.Text;
        if QEntregaConsDT_ENTREGA.Text <> '' then
          MEDtEntrega.Text := QEntregaConsDT_ENTREGA.Text
        else
          MEDtEntrega.Text := '';
        MEDtCriacao.Text := QEntregaConsDT_CRIACAO_ITEM.Text;
        DBEdit8.Text := QEntregaConsCOD_PEDIDO_CAB.Text;
        if QEntregaConsIND_SITUACAO.Value = 'P' then
          RgSituacao.ItemIndex := 0;
        if QEntregaConsIND_SITUACAO.Value = 'C' then
          RgSituacao.ItemIndex := 1;
        if QEntregaConsIND_SITUACAO.Value = 'E' then
          RgSituacao.ItemIndex := 2;
        if QEntregaConsIND_SITUACAO.Value = 'R' then
          RgSituacao.ItemIndex := 3;
        QEntregaImagem.Close;
        QEntregaImagem.Open;
        QEntregaImagem.SetVariable('COD_ENTREGA_ITEM',QEntregaItemCOD_ENTREGA_ITEM.Value);
        QEntregaImagem.Open;
        MELocaliza.Text := '';
        FmFilial1.MeFilial.SetFocus;
      end
      else
        LimpaCampos(Sender);
    end
    else
      LimpaCampos(Sender);
    end;
end;

procedure TFControleEntregaCad.CarregarImagemPNG;
var
  BlobStream: TStream;
  Png: TPNGObject;
begin
  if not DMPedido.QEntregaImagem.IsEmpty then
  begin
    BlobStream := DMPedido.QEntregaImagem.CreateBlobStream(DMPedido.QEntregaImagemIMG_ENTREGA, bmRead);
    try
      if BlobStream.Size > 0 then
      begin
        Png := TPNGObject.Create; // Ou TPngImage.Create
        try
          Png.LoadFromStream(BlobStream);
          ImgEntrega.Picture.Assign(Png);
        finally
          Png.Free;
        end;
      end
      else
        ImgEntrega.Picture := nil; // Limpa se o blob estiver vazio
    finally
      BlobStream.Free;
    end;
  end
  else
    ImgEntrega.Picture := nil; // Limpa se não houver registro
end;

procedure TFControleEntregaCad.FormCreate(Sender: TObject);
begin
  inherited;
  TPicture.RegisterFileFormat('PNG', 'Portable Network Graphics', TPNGObject);
end;

end.
