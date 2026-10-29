unit UTProducao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, DBGrids, DB, DBCtrls;

type
  TFTProducao = class(TForm)
    EPeca: TEdit;
    Label1: TLabel;
    SbOK: TSpeedButton;
    GbProducao: TGroupBox;
    DbGProducao: TDBGrid;
    DsProducao: TDataSource;
    LMensagem: TLabel;
    Label2: TLabel;
    CbSerie: TComboBox;
    SbQuebra: TSpeedButton;
    BitBtn1: TBitBtn;
    ODColetor: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure EPecaChange(Sender: TObject);
    procedure SbOKClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure EPecaKeyPress(Sender: TObject; var Key: Char);
    procedure SbQuebraClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure Grava(desconsideraQtdeCaracateres: Boolean = False);
    procedure Atualiza;
    procedure AcaoReload;
    procedure DisparaMensagem(mensagem: string; setaFoco: Boolean = True; limpaCampo: Boolean = True);
    { Private declarations }
  public
    { Public declarations }
    FAcaoReload: TNotifyEvent;
    wTipo: string; // 'EMBARQUE' 'CORTE' 'USINAGEM' 'MARCACAO' 'FORNO' 'REPOSICAO' 'FURACAO' 'LAPIDACAO' 'LAVACAO'
    wTipoQuebra: string;
    wQuery: TDataSet;
  published
    property OnAcaoReload: TNotifyEvent read FAcaoReload write FAcaoReload;
  end;

var
  FTProducao: TFTProducao;

implementation

uses UOracle_cl, UPedido_cl, UVidracaria_cl, UProducaoReposicao,
  UUsuario_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFTProducao.Grava(desconsideraQtdeCaracateres: Boolean = False);
var
  wPedidoItem, wMaterial, wSerie, wPeca, wNumReposicoes, wPedido: Integer;
  wInd, wData: string;
  wRecNo: Integer;
begin
  if EPeca.Text <> '' then
    LMensagem.Caption := ''
  else
    Exit;

  wPeca := -1;
  wSerie := -1;

  wPedidoItem := -1;
  if desconsideraQtdeCaracateres then
  begin
    wPeca := StrToInt(EPeca.Text);
    //desccomentado marcos 04/04/16
    //try
    //  wSerie := StrToInt(Trim(CbSerie.Text));
   // except
    //  wSerie := StrToInt(DMOracle.BuscaNome('SELECT MAX(NUM_SERIE) FROM TB_MATERIAL', '1=1'));
    //end;
   // wSerie := 1;
   // if DMOracle.BuscaNome('SELECT COUNT(*) FROM TB_MATERIAL', 'COD_PECA = ' + QuotedStr(IntToStr(wPeca)) + ' AND NUM_SERIE = ' + IntToStr(wSerie)) <> '1' then
    //  wPeca := -1;
    //ate aqui

    DmVidracaria.QMaterialCons.Close;
    DmVidracaria.QMaterialCons.SetVariable('COD_PECA',wPeca);
    DmVidracaria.QMaterialCons.SetVariable('NUM_SERIE',wSerie);
    DmVidracaria.QMaterialCons.Open;
    DmVidracaria.QMaterialCons.First;
    If DmVidracaria.QMaterialCons.Eof then
      wPeca := -1
  end
  else
    if ((Length(EPeca.Text) = 12) and (Copy(EPeca.Text, 7, 2) = '99')) then
    begin
      wPeca := StrToInt(Copy(EPeca.Text, 1, 6));
      wSerie := StrToInt(Copy(EPeca.Text, 9, 3));
    end
    else
      if Length(EPeca.Text) = 20 then
      begin
        wPeca := StrToInt(Copy(EPeca.Text, 1, 6));
        wSerie := StrToInt(Copy(EPeca.Text, 13, 2));
      end;

  //ALTERADO MARCOS 08/04/2016  teste para ver se melhora a velocidade pois estava muito lento
 // DmVidracaria.QMaterialCons.Close;
 // DmVidracaria.QMaterialCons.SetVariable('COD_PECA',wPeca);
 // DmVidracaria.QMaterialCons.SetVariable('NUM_SERIE',wSerie);
 // DmVidracaria.QMaterialCons.Open;
 // DmVidracaria.QMaterialCons.First;
  DmVidracaria.QRMaterial.Close;
  DmVidracaria.QRMaterial.SetVariable('COD_PECA',wPeca);
  DmVidracaria.QRMaterial.SetVariable('NUM_SERIE',wSerie);
  DmVidracaria.QRMaterial.Open;
  DmVidracaria.QRMaterial.First;
  If not DmVidracaria.QRMaterial.Eof then
  Begin
    wPedidoItem := DmVidracaria.QRMaterialCOD_PEDIDO_ITEM.Value;
    wMaterial := StrToInt(DmVidracaria.QRMaterialCOD_MATERIAL.Text);
  end;
  if ((wPeca = -1) or (wSerie = -1)) then
  begin
    if desconsideraQtdeCaracateres then
      DisparaMensagem('Peça inexistente!', False, False);
    Exit;
  end;

  if wPedidoItem = -1 then
   Exit;
  if wMaterial = -1 then
    Exit;

  if wTipo = 'REPOSICAO' then
  begin
    DmVidracaria.QQuebra.Close;//marcos 06/10/2010
    DmVidracaria.QQuebra.SetVariable('COD_PEDIDO_ITEM', wPedidoItem);
    DmVidracaria.QQuebra.Open;
    DmVidracaria.QQuebra.First;
    wPedido := StrToInt(DMOracle.BuscaNome('SELECT COD_PEDIDO_CAB FROM TB_PEDIDO_ITEM','COD_PEDIDO_ITEM='+IntToStr(wPedidoItem)));
    if DMOracle.BuscaNome('SELECT DT_BAIXA_VIDRACARIA FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB='+IntToStr(wPedido)) <> '' then
      Raise Exception.Create('Essa Peça Já foi Baixada! Não Pode dar Quebra!');
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'TEMPERMED' then
    Begin
      If ((DmVidracaria.QQuebraQT_TOTAL_QUEBRAS.Value >= 1) and (DMUsuario.CodUsuarioCorrente <> 27)) Then
        Raise Exception.Create('Essa Peça já foi Quebrada 1 vez! Passe a Reposição para o Gerente!')
    end
    else
      If ((DmVidracaria.QQuebraQT_TOTAL_QUEBRAS.Value >= 1) and (DMUsuario.Privilegiado = FALSE)) Then
        Raise Exception.Create('Essa Peça já foi Quebrada 1 vez! Passe a Reposição para o Gerente!');
    if MessageDlg('Confirma a quebra da peça ' + IntToStr(wPeca) + ' ?', mtConfirmation, [mbYes, MbNo], 0) = mrNo then
    begin
      EPeca.SetFocus;
      EPeca.Text := '';
      Exit;
    end;

    //DmVidracaria.QQuebra.Close;  //COMENTADO MARCOS 06/10/2010 TRANSFERIDO PARA CIMA
    //DmVidracaria.QQuebra.SetVariable('COD_PEDIDO_ITEM', wPedidoItem);
   // DmVidracaria.QQuebra.Open;
   // DmVidracaria.QQuebra.First;
    if not DmVidracaria.QQuebra.IsEmpty then
    begin
      DisparaMensagem('A peça ' + IntToStr(wPeca) + ' já foi quebrada em: ' + DmVidracaria.QQuebraDESC_TIPO.Value);
      Exit;
    end;

    wData := DMOracle.BuscaNome('SELECT to_char(SYSDATE, ' + QuotedStr('dd/mm/yyyy hh:mi:ss') + ') as data from dual', '1=1');

    DMOracle.ExecutaSql('INSERT INTO TB_MATERIAL_QUEBRA(COD_MATERIAL_QUEBRA, DT_QUEBRA, COD_MATERIAL, DESC_TIPO)' +
      'VALUES(SQMATERIAL_QUEBRA.NEXTVAL, CAST(' + QuotedStr(FormatDateTime('dd/MM/yyyy hh:mm:ss', DMOracle.DataHoraServ)) + ' AS TIMESTAMP), ' + IntToStr(wMaterial) + ', ' + QuotedStr(wTipoQuebra) + ')');
    DMOracle.ExecutaSql('UPDATE TB_MATERIAL SET IND_EXPORTADO = ' + QuotedStr('N') + ' WHERE COD_PEDIDO_ITEM = ' + IntToStr(wPedidoItem));
    DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_CALCULO = ' + QuotedStr('N') + ', IND_CORTE =' + QuotedStr('N') + ', IND_USINAGEM = ' + QuotedStr('N') + ', IND_MARCACAO = ' + QuotedStr('N') + ', IND_FORNO = ' + QuotedStr('N') + ', IND_EMBARQUE = ' + QuotedStr('N') + ' WHERE COD_PEDIDO_ITEM = ' + IntToStr(wPedidoItem));


    if (true) then
      Close
    Else
    Begin
      Atualiza;

      EPeca.SetFocus;
      EPeca.Text := '';
    End;
  end
  else
  begin
    wInd := '';
    //wInd := DMOracle.BuscaNome('SELECT IND_' + wTipo + ' FROM TB_ACOMPANHAMENTO_PEDIDO', 'COD_PEDIDO_ITEM=' + IntToStr(wPedidoItem));
    DmVidracaria.QAcompanhamentoCons.Close;
    DmVidracaria.QAcompanhamentoCons.SetVariable('COD_PEDIDO_ITEM',DmVidracaria.QRMaterialCOD_PEDIDO_ITEM.Text);
    DmVidracaria.QAcompanhamentoCons.Open;
    DmVidracaria.QAcompanhamentoCons.First;
    if wTipo = 'CALCULO' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_CALCULO.Text;
    if wTipo = 'CORTE' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_CORTE.Text;
    if wTipo = 'USINAGEM' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_USINAGEM.Text;
    if wTipo = 'MARCACAO' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_MARCACAO.Text;
    if wTipo = 'FORNO' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_FORNO.Text;
    if wTipo = 'EMBARQUE' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_EMBARQUE.Text;
    if wTipo = 'LAMINADO' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_LAMINADO.Text;
    if wTipo = 'FURACAO' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_FURACAO.Text;
    if wTipo = 'LAPIDACAO' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_LAPIDACAO.Text;
    if wTipo = 'LAVACAO' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_LAVACAO.Text;
    if wTipo = 'CONFERENCIA' Then
      wInd := DMVidracaria.QAcompanhamentoConsIND_CONFERENCIA.Text;

    if wInd = 'S' then
      DisparaMensagem('Peça já lida!')
    else
    begin
      DMOracle.ExecutaSql('UPDATE TB_ACOMPANHAMENTO_PEDIDO SET IND_' + wTipo + ' = ' + QuotedStr('S') + ', DT_' + wTipo + ' = CAST(' + QuotedStr(FormatDateTime('dd/MM/yyyy hh:mm:ss', DMOracle.DataHoraServ)) + ' AS TIMESTAMP) WHERE COD_PEDIDO_ITEM=' + IntToStr(wPedidoItem));

      Atualiza;

      EPeca.SetFocus;
      EPeca.Text := '';
    end;
  end;
end;

procedure TFTProducao.DisparaMensagem(mensagem: string; setaFoco: Boolean = True; limpaCampo: Boolean = True);
begin
  LMensagem.Caption := mensagem;
  if setaFoco then
  begin
    EPeca.SetFocus;
    EPeca.SelectAll;
  end;
  if limpaCampo then
    EPeca.Clear;
end;

procedure TFTProducao.FormCreate(Sender: TObject);
begin
  if ((wTipo <> 'EMBARQUE')
    and (wTipo <> 'CORTE')
    and (wTipo <> 'USINAGEM')
    and (wTipo <> 'MARCACAO')
    and (wTipo <> 'FORNO')
    and (wTipo <> 'REPOSICAO')
    and (wTipo <> 'LAMINADO')
    and (wTipo <> 'CONFERENCIA')
    and (wTipo <> 'FURACAO')
    and (wTipo <> 'LAPIDACAO')
    and  (wTipo <> 'LAVACAO'))  then
  begin
    MessageDlg('Tipo da tela não definido!', mtWarning, [mbOK], 0);
    Close;
    Abort;
  end;

  {DmVidracaria.QSerie.Close;
  DmVidracaria.QSerie.Open;
  DmVidracaria.QSerie.First;
  CbSerie.Items.Clear;
  while not DmVidracaria.QSerie.Eof do
  begin
    CbSerie.Items.Add(FormatFloat('000', DmVidracaria.QSerieNUM_SERIE.Value));
    DmVidracaria.QSerie.Next;
  end;
  DmVidracaria.QSerie.First;
  CbSerie.ItemIndex := 0; }
  CbSerie.Items.Add('2');
  CbSerie.Items.Add('1');
  CbSerie.ItemIndex := 0;
  if wQuery = nil then
    wQuery := DMPedido.QItensProducaoCons;
  DsProducao.DataSet := wQuery;
end;

procedure TFTProducao.EPecaChange(Sender: TObject);
begin
  Grava;
end;

procedure TFTProducao.SbOKClick(Sender: TObject);
begin
  Grava(True);
end;

procedure TFTProducao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMPedido.QItensProducaoCons.Close;
end;

procedure TFTProducao.FormActivate(Sender: TObject);
var
  wRecNo: integer;
begin
  DisparaMensagem('');
  Atualiza;
end;

procedure TFTProducao.Atualiza;
var
  wRecNo: integer;
begin  

  if wQuery = DMPedido.QItensProducaoCons then
  begin
    DMPedido.QItensProducaoCons.Close;
    DMPedido.QItensProducaoCons.SetVariable('COD_PEDIDO_CAB', NULL);
    DMPedido.QItensProducaoCons.SetVariable('COD_PEDIDO_ITEM', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_FORNO', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_USINAGEM', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_MARCACAO', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_CORTE', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_REPOSICAO', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_EMBARQUE', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_LAMINADO', NULL);
    DMPedido.QItensProducaoCons.SetVariable('DT_FURACAO', Null);
    DMPedido.QItensProducaoCons.SetVariable('DT_LAPIDACAO', Null);
    DMPedido.QItensProducaoCons.SetVariable('DT_LAVACAO', Null);
    DMPedido.QItensProducaoCons.SetVariable('DT_' + wTipo, DMOracle.DataServ);
    DMPedido.QItensProducaoCons.Open;
    DMPedido.QItensProducaoCons.Last;
    wRecNo := DMPedido.QItensProducaoCons.RecNo;
    DMPedido.QItensProducaoCons.RecNo := wRecNo;
  end
  else
    AcaoReload;
end;

procedure TFTProducao.AcaoReload;
begin
  if Assigned(FAcaoReload) then FAcaoReload(Self);
end;

procedure TFTProducao.EPecaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    SbOK.Click;
end;

procedure TFTProducao.SbQuebraClick(Sender: TObject);
begin 
  if FProducaoReposicao = nil then
    FProducaoReposicao := TFProducaoReposicao.Create(Application);
  FProducaoReposicao.wTipoQuebra := wTipo;
  FProducaoReposicao.Caption := 'Quebra em: ' + FProducaoReposicao.wTipoQuebra;
  FProducaoReposicao.GbProducao.Caption := '[ Quebra em: ' + FProducaoReposicao.wTipoQuebra + ' ]';
  FProducaoReposicao.SbQuebra.Visible := False;
  FProducaoReposicao.ShowModal;
end;

procedure TFTProducao.BitBtn1Click(Sender: TObject);
var arq: TextFile;
  linha: string;

begin
  If wTipo = 'EMBARQUE' Then
  Begin
    if ODColetor.Execute then
    begin
      AssignFile(arq, ODColetor.FileName);

      Reset(arq);
      while not Eof(arq) do
      begin
        ReadLn(arq, linha);
        if Length(linha) = 15 then
        Begin
          EPeca.Text := copy(linha,2,12);
          CbSerie.Text := copy(linha,12,1);
          Grava;
        end
        else
        if Length(linha) = 7 then
        Begin
          EPeca.Text := copy(linha,1,6);
          CbSerie.Text := copy(linha,7,1);
          Grava;
        end;
      end;
      CloseFile(arq);
    end;
  end
  else
    ShowMessage('Use o Leitor de Código de Barras!');  
end;

end.
