unit UCupomFiscalCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DB, DBPanel, StdCtrls, Grids, DBGrids, Mask,
  DBCtrls, dblookup, ActnList, ComCtrls,Registry;

type
  TFCupomFiscalCad = class(TForm)
    Panel1: TPanel;
    sbIniciarVenda: TSpeedButton;
    sbCancelarVenda: TSpeedButton;
    GroupBox1: TGroupBox;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DsPrimario: TDataSource;
    GroupBox2: TGroupBox;
    DBGItens: TDBGrid;
    DsItens: TDataSource;
    meQtde: TMaskEdit;
    Label1: TLabel;
    meProduto: TMaskEdit;
    Label2: TLabel;
    edDescProduto: TEdit;
    BtProduto: TBitBtn;
    DBTSituacao: TDBText;
    DBPanel4: TDBPanel;
    btCancelarItem: TSpeedButton;
    btAdicinaDesconto: TSpeedButton;
    btCancelaDescontoItem: TSpeedButton;
    lbTotal: TLabel;
    btFecharCupom: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    lbSubtotal: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBPanel3: TDBPanel;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    acAbreMenuFiscal: TAction;
    btNFe: TSpeedButton;
    GroupBox3: TGroupBox;
    MePercDesc: TMaskEdit;
    MeValDesc: TMaskEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    MeValUnitario: TMaskEdit;
    acIniciaVenda: TAction;
    acCancelaVenda: TAction;
    acFechaCupom: TAction;
    dbMsgProm: TDBPanel;
    btMensagemCons: TBitBtn;
    sbVerifica: TSpeedButton;
    sbRelatorio: TSpeedButton;
    procedure sbIniciarVendaClick(Sender: TObject);
    procedure sbCancelarVendaClick(Sender: TObject);
    procedure meProdutoExit(Sender: TObject);
    procedure BtProdutoClick(Sender: TObject);
    procedure meQtdeExit(Sender: TObject);
    procedure meQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure DsPrimarioDataChange(Sender: TObject; Field: TField);
    procedure btCancelarItemClick(Sender: TObject);
    procedure btAdicinaDescontoClick(Sender: TObject);
    procedure btCancelaDescontoItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAddDescontoSubTotalClick(Sender: TObject);
    procedure btCancDescontoSubTotalClick(Sender: TObject);
    procedure btAddDespesaSubTotalClick(Sender: TObject);
    procedure btCancDespesaSubTotalClick(Sender: TObject);
    procedure DsItensDataChange(Sender: TObject; Field: TField);
    procedure btFecharCupomClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure acAbreMenuFiscalExecute(Sender: TObject);
    procedure acIniciarVenda(Sender: TObject);
    procedure acCancelarVenda(Sender: TObject);
    procedure acFecharCupom(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btNFeClick(Sender: TObject);
    procedure MeValDescExit(Sender: TObject);
    procedure MePercDescExit(Sender: TObject);
    procedure meQtdeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MeValUnitarioChange(Sender: TObject);
    procedure btMensagemConsClick(Sender: TObject);
    procedure sbVerificaClick(Sender: TObject);
    procedure sbRelatorioClick(Sender: TObject);
  private
    fSubtotalizado: Boolean;
    fSubTotal: Real;
    fTotal: Real;
    procedure AtualizaSubTotal;
    procedure AtualizaEstadoBotoes;
    procedure mostraGT;
    procedure BloqueiaTela;
    procedure setStatus(pMensagem: String);
    procedure AbreUltimoCupomFiscal;
    procedure Analisa_iRetorno();
    procedure AddItem;
  public
    property pSubtotalizado: Boolean read fSubtotalizado write fSubtotalizado default False;
  end;

var
  FCupomFiscalCad: TFCupomFiscalCad;
  Registry: TRegistry;

implementation

uses UImpressoraFiscal_cl, UCadastro_cl, UCadastroCons, UImpressoraFiscal,
  UOracle_cl, UProduto_cl, UProdutoCons, UTefInputBox,
  UCupomFiscalFechamento, UParamSistema_cl, UTef, UTef_cl, TefUtils,
  UNotaSaida_cl, UEstoque_cl, UPafNfeParam, UNotaSaidaCad, Math, UBiblioteca,
  UMensagem_cl, UMensagemCons, UUsuario_cl, UCupomFiscalParam,
  URCupomFiscal, UFmDatas, StrUtils, USerie_cl;

{$R *.dfm}

procedure TFCupomFiscalCad.sbIniciarVendaClick(Sender: TObject);
var
  wDataImpressora: TDateTime;
  wNumeroCupom, wNumCoo: Integer;
  wNumSerieEcf, wData, wHora: String;
  wTipoCadastro: String;
begin
  setStatus('Verificando se o PAF-ECF está em condições de uso...');
  if not FImpressoraFiscal.VerificaPAFECFLiberado then
  begin
    MessageDlg('PAF-ECF está sem condições de emitir documentos fiscais!', mtError, [mbOK], 0);
    setStatus('PAF-ECF está sem condições de emitir documentos fiscais!');
    sbIniciarVenda.Enabled := False;
    sbCancelarVenda.Enabled := False;
    sbVerifica.Enabled := true;
    Exit;
  end;
  setStatus('');
  DMImpressoraFiscal.QCupomFiscalCab.Close;
  DMImpressoraFiscal.QCupomFiscalCab.SetVariable('PK', -1);
  DMImpressoraFiscal.QCupomFiscalCab.Open;
  DMImpressoraFiscal.QCupomFiscalItem.Close;
  DMImpressoraFiscal.QCupomFiscalItem.SetVariable('COD_NOTA_CAB', -1);
  DMImpressoraFiscal.QCupomFiscalItem.Open;
  DMCadastro.QCadastro.Close;
  DMCadastro.QCadastro.SetVariable('PK',-1);
  DMCadastro.QCadastro.Open;
  if FCadastroCons = nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  FCadastroCons.StatusBar1.Panels[0].Text :=
    'ESC OU CANCELAR PARA INFORMAR UM CLIENTE SEM CADASTRO NO SISTEMA';
  if FCadastroCons.ShowModal = mrOk then
  begin
    wTipoCadastro := 'CADASTRADO';
    FCupomFiscalParam.Free;
    FCupomFiscalParam := Nil;
    DMCadastro.QCadastro.Close;
    DMCadastro.QCadastro.SetVariable('PK',DMCadastro.QCadastroConsCOD_CADASTRO.Value);
    DMCadastro.QCadastro.Open;
  end
  else
  begin
    if FCupomFiscalParam = Nil then
      FCupomFiscalParam := TFCupomFiscalParam.Create(Application);
    FCupomFiscalParam.PGRelatorio.Pages[1].TabVisible := true;
    if FCupomFiscalParam.ShowModal = mrOk then
    begin
      wTipoCadastro := 'NAOCADASTRADO';
      if (FCupomFiscalParam.leCGCCPF.Text = '') or
        (FCupomFiscalParam.leNome.Text = '') or
        (FCupomFiscalParam.leEndereco.Text = '') then
      begin
        MessageDlg('Dados de cliente incorretos', mtError, [mbOk], 0);
        Abort;
      end;
    end
    else
      abort;
  end;
    pSubtotalizado := False;
    with DMImpressoraFiscal do
    begin
      //verificar condições de uso novamente
      setStatus('Verificando se o PAF-ECF está em condições de uso...');
      if not FImpressoraFiscal.VerificaPAFECFLiberado then
      begin
        MessageDlg('PAF-ECF está sem condições de emitir documentos fiscais!', mtError, [mbOK], 0);
        setStatus('PAF-ECF está sem condições de emitir documentos fiscais!');
        sbIniciarVenda.Enabled := False;
        sbVerifica.Enabled := true;
        Exit;
      end;
      setStatus('');
      try
        QCupomFiscalCab.Insert;
        if not DMCadastro.QCadastroCOD_CADASTRO.IsNull then
        begin
          QCupomFiscalCabCOD_CADASTRO.Value := DMCadastro.QCadastroCOD_CADASTRO.Value;
          QCupomFiscalCabCOD_ESTADO.Value := DMCadastro.QCadastroCOD_ESTADO.Value;
        end
        else
        begin
          if DMUsuario.CodClientePadrao = 0 then
          begin
            MessageDlg('Cliente padrão não informado no cadastro do usuário',
              mtError,[mbok],0);
            Abort;
          end;
          QCupomFiscalCabCOD_CADASTRO.Value := DMUsuario.CodClientePadrao;
          QCupomFiscalCabCOD_ESTADO.Text := DMOracle.FastSelect('COD_ESTADO',
            'TB_CADASTRO','COD_CADASTRO = '+ IntToStr(DMUsuario.CodClientePadrao));
        end;
        setStatus('Abrindo cupom fiscal...');
        if FImpressoraFiscal.AbreCF(QCupomFiscalCabCOD_CADASTRO.Value,
          wDataImpressora, wNumeroCupom, wNumCoo, wNumSerieEcf,FCupomFiscalParam) then
        begin
          QCupomFiscalCabDT_EMISSAO.Value := StrToDateTime(FormatDateTime('dd/mm/yyyy HH:MM:SS', wDataImpressora));
          QCupomFiscalCabDT_RECEBIMENTO.Value := StrToDateTime(FormatDateTime('dd/mm/yyyy', wDataImpressora));
          QCupomFiscalCabDT_MOVIMENTO.Value := wDataImpressora;
          QCupomFiscalCabNUM_NOTA.Value := wNumeroCupom;
          QCupomFiscalCabNUM_SERIE_ECF.Value := wNumSerieEcf;
          QCupomFiscalCabNUM_COO.Value := wNumCoo;
          QCupomFiscalCab.Post;
          try
            AtualizaSubTotal;
          Except
          end;
          setStatus('Aguardando comando...');
        end
        else
        begin
          QCupomFiscalCab.Cancel;
          if FImpressoraFiscal.CancelaCupom then
            FormCreate(Self);  
        end;
      Except
        on E: Exception do
        begin
          setStatus('Cancelando cupom fiscal...');
          if FImpressoraFiscal.CancelaCupom then
            MessageDlg('Não foi possível gravar as informações no banco de dados, o cupom fiscal foi cancelado!'
              + 'Detalhes: ' + e.Message, mtWarning, [mbOK], 0);
          QCupomFiscalCab.Cancel;
          setStatus('Aguardando comando...');
        end;
      end;
    end;

    if meProduto.Enabled then
    begin
      meProduto.SetFocus;
      meProduto.SelectAll;
    end;
  //end;
  //else
//  begin
//    AbreUltimoCupomFiscal;
//    setStatus('Aguardando comando...');
//  end;
end;

procedure TFCupomFiscalCad.sbCancelarVendaClick(Sender: TObject);
var wCodigo: Integer;
  cCPF,cNomeCliente: String;
  x,y: Array of String;
begin
  if MessageDlg('Deseja realmente cancelar este cupom?', mtConfirmation,
    [mbYes,mbNo],2) = mrNo then
    Abort;

  with DMImpressoraFiscal do
  begin
    if QCupomFiscalCabIND_SITUACAO.Value = '3' then
    begin
      QCupomFiscalCab.RefreshRecord;
      raise exception.Create('O cupom fiscal já está cancelado');
    end;
    if QCupomFiscalCabIND_SITUACAO.Value = '2' then
    begin
      setStatus('Voltando titulos...');
      if DMImpressoraFiscal.ContasAReceberBaixados then  //apenas verifica se existem titulos baixados.
      begin
        setStatus('Aguardando comando...');
        Raise Exception.Create('Contas a receber com baixa. Impossível cancelar');
      end;
      setStatus('Cancelando cupom fiscal...');

      //Cancelamento tef
      SetLength(x,3);
      SetLength(y,3);
      x[0] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+
        QCupomFiscalCabCOD_CADASTRO.Text;
      x[1] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+
        QCupomFiscalCabCOD_CADASTRO.Text;
      x[2] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO WHERE COD_CADASTRO = '+
        QCupomFiscalCabCOD_CADASTRO.Text;
      DMOracle.BuscaNomes(x,y);
      iRetorno := Bematech_FI_EstornoNaoFiscalVinculadoMFD( pchar( y[0] ),
        copy(pchar(y[1]),1,30), pchar( copy(y[2],1,80) ) );
      FImpressoraFiscal.Analisa_iRetorno();

      if not FImpressoraFiscal.CancelaCupom then
      begin
        setStatus('Aguardando comando...');
        Abort;
      end;
      setStatus('Voltando baixa no estoque...');
      DMImpressoraFiscal.VoltaEstoqueEPagamentos;
    end
    else
    begin
      setStatus('Verificando se o cupom fiscal está aberto...');
      if FImpressoraFiscal.cupomAberto then
      begin
        setStatus('Cancelando cupom fiscal...');
        //Cancelamento tef
        SetLength(x,3);
        SetLength(y,3);
        x[0] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+
          QCupomFiscalCabCOD_CADASTRO.Text;
        x[1] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+
          QCupomFiscalCabCOD_CADASTRO.Text;
        x[2] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO WHERE COD_CADASTRO = '+
          QCupomFiscalCabCOD_CADASTRO.Text;
        DMOracle.BuscaNomes(x,y);
        iRetorno := Bematech_FI_EstornoNaoFiscalVinculadoMFD( pchar( y[0] ),
          copy(pchar(y[1]),1,30), pchar( copy(y[2],1,80) ) );
        FImpressoraFiscal.Analisa_iRetorno();
        if not FImpressoraFiscal.CancelaCupom then
        begin
          setStatus('Aguardando comando...');
          Abort;
        end;
      end;
    end;
    setStatus('Aguardando comando...');

    //Fecha a query para corrigir erros de lock em tabela
    wCodigo := QCupomFiscalCabCOD_NOTA_CAB.Value;
    QCupomFiscalCab.Close;
    QCupomFiscalCab.SetVariable('PK',wCodigo);
    QCupomFiscalCab.Open;
    QCupomFiscalCab.Edit;
    QCupomFiscalCabIND_SITUACAO.Value := '3';
    QCupomFiscalCab.Post;

    meQtde.Clear;
    meProduto.Clear;
    edDescProduto.Clear;
    AtualizaSubTotal;
  end;
  mostraGT;
end;

procedure TFCupomFiscalCad.meProdutoExit(Sender: TObject);
var
  wDescricao: String;
  wCodigo: String;
begin
  if trim(meProduto.Text) <> '' then
  begin
    try
      wCodigo := Trim(meProduto.Text);
    except
      meProduto.SetFocus;
      meProduto.SelectAll;
      raise Exception.Create('Código do produto inválido. Verifique!');
    end;
    if Trim(DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(wCodigo))) <> '' then
    begin
      wDescricao := DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(wCodigo));
      if Trim(wDescricao) = '' then
         MessageDlg('Produto cadastrado sem descrição!' + #13 + #10
          + 'Não será possível adiciona-lo ao cupom fiscal!', mtWarning, [mbOK], 0);
      edDescProduto.Text := wDescricao;
      MeValUnitario.Text :=
        DMOracle.BuscaNome('SELECT NVL(VAL_VAREJO,0) FROM TB_PRODUTO',
        'DESC_COD_BARRA  = ' + QuotedStr(wCodigo));
    end
    else
    begin
      edDescProduto.Text := 'PRODUTO NÃO CADASTRADO!';
      MessageDlg('Produto não cadastrado!', mtWarning, [mbOK], 0);
      meProduto.SetFocus;
      meProduto.SelectAll;
    end
  end
  else
    edDescProduto.Text := '';
end;

procedure TFCupomFiscalCad.BtProdutoClick(Sender: TObject);
begin
  if FProdutoCons = nil then
    FProdutoCons := TFProdutoCons.Create(Application);
  FProdutoCons.HabilitaColunasPaf;
  if FProdutoCons.ShowModal = mrOk then
  begin
    meProduto.Text := DMProduto.QProdutoConsDESC_COD_BARRA.AsString;
    if Trim(meProduto.Text) = '' then
    begin
      MessageDlg('Produto sem código GTIN (Código de barras)',mtError,[mbOk],0);
      Abort;
    end;
    meProdutoExit(Self);
    meQtde.SetFocus;
  end;
end;

procedure TFCupomFiscalCad.meQtdeExit(Sender: TObject);
var
  wQtde: Real;
  wQtdeAux: String;
begin
  if Trim(meProduto.Text) = '' then
  begin
    MeProduto.SetFocus;
    MeProduto.SelectAll;
    Abort;
  end;
  wQtdeAux := Trim(meQtde.Text);
  if wQtdeAux <> '' then
  begin
    try
      wQtde := StrToFloat(wQtdeAux);
    except
      meQtde.SetFocus;
      meQtde.SelectAll;
      raise Exception.Create('Valor da quantidade é inválido. Verifique!');
    end;
    if wQtde < 0.001 then
    begin
      meQtde.SetFocus;
      meQtde.SelectAll;
      raise Exception.Create('Não é permitido informar valor nulo(zero) ou negativo!');
    end;
    if not (wQtde < 10000) then
    begin
      meQtde.SetFocus;
      meQtde.SelectAll;
      raise Exception.Create('O valor máximo permitido é 9999,999!');
    end;
    if (Pos(',', wQtdeAux) <> 0) and ((Length(wQtdeAux) - Pos(',', wQtdeAux)) > 3) then //verifica se tem mais de 3 casa decimais
    begin
      wQtde := trunc(wQtde * 1000)/1000;
      meQtde.Text := FormatFloat('0.000', wQtde);
      MessageDlg('Foram informadas mais de 3 casas decimais. Apenas 3 serão consideradas!', mtWarning, [mbOK], 0);
    end;
  end
  else
  begin
    MessageDlg('Quantidade não informada', mtError, [mbOk],0);
    meQtde.SetFocus;
    meQtde.SelectAll;
  end;
end;

procedure TFCupomFiscalCad.meQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  if (not (key in ['0'..'9', ',', #8])) then
    key := #0;        
end;

procedure TFCupomFiscalCad.AddItem;
var
  wTributacao, wValorUnit, wProduto, wGT, wSituacaoTrib, wIndiceTrib: String;
  wCodProduto, wAuxValorUnit: Real;
  wNumItem: Integer;
  wValorDesconto: Double;
  x,y: Array of string;
  wCodigo: Integer;
begin
  with DMImpressoraFiscal do
  begin
    if not FImpressoraFiscal.VerificaPAFECFLiberado then
    begin
      MessageDlg('PAF-ECF está sem condições de emitir documentos fiscais!', mtError, [mbOK], 0);
      setStatus('PAF-ECF está sem condições de emitir documentos fiscais!');
      sbIniciarVenda.Enabled := False;
      sbCancelarVenda.Enabled := False;
      sbVerifica.Enabled := true;
      setStatus('Verificando se o cupom fiscal está aberto...');
      if FImpressoraFiscal.cupomAberto then
      begin
        setStatus('Cancelando cupom fiscal...');
        //Cancelamento tef
        SetLength(x,3);
        SetLength(y,3);
        x[0] := 'SELECT NUM_CGC_CPF FROM TB_CADASTRO WHERE COD_CADASTRO = '+
          QCupomFiscalCabCOD_CADASTRO.Text;
        x[1] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+
          QCupomFiscalCabCOD_CADASTRO.Text;
        x[2] := 'SELECT DESC_ENDERECO FROM TB_CADASTRO WHERE COD_CADASTRO = '+
          QCupomFiscalCabCOD_CADASTRO.Text;
        DMOracle.BuscaNomes(x,y);
        iRetorno := Bematech_FI_EstornoNaoFiscalVinculadoMFD( pchar( y[0] ),
          copy(pchar(y[1]),1,30), pchar( copy(y[2],1,80) ) );
        FImpressoraFiscal.Analisa_iRetorno();
        if not FImpressoraFiscal.CancelaCupom then
        begin
          setStatus('Aguardando comando...');
          Abort;
        end;
      end;
      
      setStatus('Aguardando comando...');

      //Fecha a query para corrigir erros de lock em tabela
      wCodigo := QCupomFiscalCabCOD_NOTA_CAB.Value;
      QCupomFiscalCab.Close;
      QCupomFiscalCab.SetVariable('PK',wCodigo);
      QCupomFiscalCab.Open;
      QCupomFiscalCab.Edit;
      QCupomFiscalCabIND_SITUACAO.Value := '3';
      QCupomFiscalCab.Post;
      Exit;
    end;
  end;

  wProduto := trim(meProduto.Text);
  if wProduto = '' then
    raise Exception.Create('O produto deve ser informado!');
  if trim(meQtde.Text) = '' then
    raise Exception.Create('A quantidade deve ser informada!');

  try
    wCodProduto := StrToFloat(DMOracle.FastSelect('COD_PRODUTO','TB_PRODUTO',
      'DESC_COD_BARRA = '+QuotedStr(wProduto)));
  except
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      +'O código do produto informado é inválido!');
  end;
  if Trim(DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = '
    + QuotedStr(wProduto))) = '' then
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      +'O produto informado não está cadastrado!');

  if Trim(DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = '
    + QuotedStr(wProduto))) = '' then
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      +'O produto informado não possui descrição!');

  if Trim(DMOracle.FastSelect('DESC_UNIDADE', 'TB_PRODUTO', 'DESC_COD_BARRA = '
    + QuotedStr(wProduto))) = '' then
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      +'O produto informado não possui unidade de medida!');

  wTributacao := trim(DMOracle.FastSelect('COD_TRIBUTACAO', 'TB_PRODUTO',
    'DESC_COD_BARRA = ' + QuotedStr(wProduto)));

  wSituacaoTrib := trim(DMOracle.FastSelect('COD_TRIB_IMP_FISCAL', 'TB_TRIBUTACAO',
    'COD_TRIBUTACAO = ' + wTributacao));
  if wSituacaoTrib <> '' then
  begin
    if (wSituacaoTrib[1] = 'T') or (wSituacaoTrib[1] = 'S') then
    begin
      wIndiceTrib := trim(DMOracle.FastSelect('NUM_INDICE_TRIB_ECF', 'TB_TRIBUTACAO',
        'COD_TRIBUTACAO = ' + wTributacao));
      if wIndiceTrib = '' then
        raise exception.create('Não é possível adicionar este item.' + #13 + #10
          +'O produto informado não possui indice da aliquota cadastrada!');
    end;
  end
  else
    raise exception.create('Não é possível adicionar este item.' + #13 + #10
      +'O produto informado não possui situação tributaria cadastrada!');


  wValorUnit := trim(DMOracle.FastSelect('VAL_VAREJO', 'TB_PRODUTO',
    'DESC_COD_BARRA = ' + QuotedStr(wProduto)));
  if wValorUnit = '' then
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      +'O produto informado não possui preço cadastrado!');

  wAuxValorUnit := trunc(StrToFloat(wValorUnit)*1000)/1000;
  if wAuxValorUnit < 0.001 then
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      +'O preço informado no produto é nulo(zero) ou negativo!');

  if wAuxValorUnit >= 1000000.000 then
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      +'O preço do produto excede o valor máximo de 999.999,999!');

  if (trunc(wAuxValorUnit * StrToFloat(trim(meQtde.Text)) * 100)/100)< 0.01 then
    raise Exception.Create('Não é possível adicionar este item.' + #13 + #10
      + 'Valor total(quantidade x valor unitário) é nulo(zero)!');
  if not FImpressoraFiscal.cupomAberto then
  begin
    with DMImpressoraFiscal do
    begin
      QCupomFiscalCab.Edit;
      QCupomFiscalCabIND_SITUACAO.Value := '3';
      QCupomFiscalCab.Post;
    end;
    MessageDlg('Falha na comunicação ou impressora bloqueada.',mtError,[mbOk],0);
    sbIniciarVenda.Enabled := false;
    sbCancelarVenda.Enabled := false;
    btFecharCupom.Enabled := false;
    sbVerifica.Enabled := true;
    Abort;
  end;
  with DMImpressoraFiscal do
  begin
    QCupomFiscalItem.Append;
    QCupomFiscalItemCOD_PRODUTO.Value := wCodProduto;
    QCupomFiscalItemQT_QUANTIDADE.Value := StrToFloat(trim(meQtde.Text));
    QCupomFiscalItemCOD_TRIBUTACAO.Value := StrToInt(wTributacao);
    QCupomFiscalItemVAL_UNITARIO.Value := StrToFloat(wValorUnit);
    setStatus('Adicionando item ao cupom fiscal...');
    if FImpressoraFiscal.VendeItem(wNumItem) then
    begin
      QCupomFiscalItemNUM_ITEM_CF.Value := wNumItem;
      QCupomFiscalItem.Post;
      QCupomFiscalItem.RefreshRecord;
      meQtde.Clear;
      meProduto.Clear;
      edDescProduto.Clear;
      MeValUnitario.Clear;

      //Desconto
      wValorDesconto := StrToFloat(bib.LimpaNumero(Trim(MeValDesc.Text),true));
      if wValorDesconto > 0 then
      begin
        if wValorDesconto >= QCupomFiscalItemVAL_UNITARIO.Value then
          raise Exception.Create('Valor de desconto maior ou igual ao valor do item!');
        QCupomFiscalItem.RefreshRecord;
        QCupomFiscalItem.Edit;
        QCupomFiscalItemVAL_DESCONTO.Value := wValorDesconto;
        setStatus('Adicionando desconto ao item...');
        if FImpressoraFiscal.AdicionaDescontoItem then
        begin
          QCupomFiscalItem.Post;
          AtualizaSubTotal;
          MePercDesc.Text := '000';
          MeValDesc.Text := '0,00';
        end
        else
          QCupomFiscalItem.Cancel;
      end;
    end
    else
    begin
      QCupomFiscalItem.Cancel;
      QCupomFiscalCab.Edit;
      QCupomFiscalCabIND_SITUACAO.Value := '3';
      QCupomFiscalCab.Post;
      self.FormCreate(Self);
    end;

    AtualizaSubTotal;
    setStatus('Aguardando comando...');
  end;
  mostraGT;
end;

procedure TFCupomFiscalCad.DsPrimarioDataChange(Sender: TObject;
  Field: TField);
var
  wIniciarVenda, wCancelarVenda, wControlesItens: Boolean;
begin
  wIniciarVenda := (DMImpressoraFiscal.QCupomFiscalCab.RecordCount = 0) or
    (DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value = '2') or
    (DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value = '3') and
    (FImpressoraFiscal.cupomAberto)  ;
  sbIniciarVenda.Enabled := wIniciarVenda;
  wCancelarVenda := (DMImpressoraFiscal.QCupomFiscalCab.RecordCount > 0) and
    ((DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value = '1') or
      (DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value = '2'));
  sbCancelarVenda.Enabled := wCancelarVenda;
  wControlesItens := (DMImpressoraFiscal.QCupomFiscalCab.RecordCount > 0) and
    (DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value = '1')
    and (not pSubtotalizado);
  meQtde.Enabled := wControlesItens;
  meProduto.Enabled := wControlesItens;
  BtProduto.Enabled := wControlesItens;
  
  MePercDesc.Enabled := wControlesItens;
  MeValDesc.Enabled := wControlesItens;
  btMensagemCons.Enabled := wControlesItens;
  AtualizaEstadoBotoes;
end;

procedure TFCupomFiscalCad.btCancelarItemClick(Sender: TObject);
begin
  with DMImpressoraFiscal do
  begin
    if QCupomFiscalItem.RecordCount = 0 then
      raise exception.Create('Nenhum item foi adicionado ao cupom fiscal.' + #13 + #10
        + 'Não existe item para ser cancelado!');
    if QCupomFiscalItemNUM_ITEM_CF.Value <= (QCupomFiscalItem.RecordCount - 100) then
      raise Exception.Create('Item fora da faixa de cancelamento.' + #13 + #10
        + 'Apenas os 100 ultimos podem ser cancelados!');
    if QCupomFiscalItemIND_CANC_ITEM_CF.Value = 'S' then
      raise Exception.Create('Não é possivel cancelar.' + #13 + #10
        + 'O item selecionado já está cancelado.');
    setStatus('Verificando se o cupom fiscal está aberto...');
    if not FImpressoraFiscal.cupomAberto then
    begin
      with DMImpressoraFiscal do
      begin
        QCupomFiscalCab.Edit;
        QCupomFiscalCabIND_SITUACAO.Value := '3';
        QCupomFiscalCab.Post;
      end;
      setStatus('Aguardando comando...');
      MessageDlg('Falha de comunicação ou impressora bloqueada. O cupom foi cancelado',mtError,
        [mbOk],0);
      sbIniciarVenda.Enabled := false;
      sbCancelarVenda.Enabled := false;
      btFecharCupom.Enabled := false;
      sbVerifica.Enabled := true;
      Abort;
    end;
    setStatus('Cancelando item...');
    if FImpressoraFiscal.CancelaItem(QCupomFiscalItemNUM_ITEM_CF.Value) then
    begin
      QCupomFiscalItem.RefreshRecord;
      QCupomFiscalItem.Edit;
      QCupomFiscalItemIND_CANC_ITEM_CF.Value := 'S';
      QCupomFiscalItem.Post;
      AtualizaSubTotal;
    end;
    setStatus('Aguardando comando...');
  end;
  mostraGT;
end;

procedure TFCupomFiscalCad.btAdicinaDescontoClick(Sender: TObject);
var
  wValorDesconto: Real;
begin
  if FTefInputBox = nil then
    FTefInputBox := tFTefInputBox.Create(Application);
  FTefInputBox.configura('Informe o valor', 'Informe o valor do desconto unitário', true, false, 3, 14, 'VALOR3', 0);
  if FTefInputBox.ShowModal = mrOk then
  begin
    with DMImpressoraFiscal do
    begin
      wValorDesconto := StrToFloat(FTefInputBox.edValor.Text);
      if wValorDesconto >= QCupomFiscalItemVAL_UNITARIO.Value then
        raise Exception.Create('Valor de desconto maior ou igual ao valor do item!');
      setStatus('Verificando se o cupom fiscal está aberto...');
      if not FImpressoraFiscal.cupomAberto then
      begin
        with DMImpressoraFiscal do
        begin
          QCupomFiscalCab.Edit;
          QCupomFiscalCabIND_SITUACAO.Value := '3';
          QCupomFiscalCab.Post;
        end;
        setStatus('Aguardando comando...');
        raise Exception.Create('Impressora aguardando RZ ou bloqueada por RZ, o cupom fiscal foi cancelado.');
      end;
      QCupomFiscalItem.RefreshRecord;
      QCupomFiscalItem.Edit;
      QCupomFiscalItemVAL_DESCONTO.Value := wValorDesconto;
      setStatus('Adicionando desconto ao item...');
      if FImpressoraFiscal.AdicionaDescontoItem then
      begin
        QCupomFiscalItem.Post;
        AtualizaSubTotal;
      end
      else
        QCupomFiscalItem.Cancel;
      setStatus('Aguardando comando...');
    end;
  end;
  mostraGT;
end;

procedure TFCupomFiscalCad.btCancelaDescontoItemClick(Sender: TObject);
begin
  if (MessageDlg('Deseja mesmo cancelar o desconto do item selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    with DMImpressoraFiscal do
    begin
      if QCupomFiscalItem.RecordCount = 0 then
        raise exception.Create('Nenhum item foi adicionado ao cupom fiscal.' + #13 + #10
          + 'Não existe item para ser cancelado!');
      if QCupomFiscalItemNUM_ITEM_CF.Value <= (QCupomFiscalItem.RecordCount - 300) then
        raise Exception.Create('Item fora da faixa de cancelamento.' + #13 + #10
          + 'Apenas os 300 ultimos podem ter seus descontos cancelados!');
      if QCupomFiscalItemVAL_DESCONTO.Value = 0.00 then
        raise Exception.Create('Não é possivel cancelar.' + #13 + #10
          + 'O item selecionado não possui desconto.');
      setStatus('Verificando se o cupom fiscal está aberto...');
      if not FImpressoraFiscal.cupomAberto then
      begin
        with DMImpressoraFiscal do
        begin
          QCupomFiscalCab.Edit;
          QCupomFiscalCabIND_SITUACAO.Value := '3';
          QCupomFiscalCab.Post;
        end;
        sbIniciarVenda.Enabled := false;
        sbCancelarVenda.Enabled := false;
        btFecharCupom.Enabled := false;
        sbVerifica.Enabled := true;
        setStatus('Aguardando comando...');
        MessageDlg('Falha de comunicação ou impressora bloqueada. O cupom foi cancelado.',
          mtError,[mbok],0);
        Abort;
      end;
      setStatus('Cancelando desconto do item...');
      if FImpressoraFiscal.CancelaDescontoItem then
      begin
        QCupomFiscalItem.RefreshRecord;
        QCupomFiscalItem.Edit;
        QCupomFiscalItemVAL_DESCONTO.Value := 0.00;
        QCupomFiscalItem.Post;
        AtualizaSubTotal;
      end;
      setStatus('Aguardando comando...');
    end;
  end;
  mostraGT;
end;

procedure TFCupomFiscalCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value = '1' then
  begin
    MessageDlg('Não é possível sair durante a emissão do cupom fiscal!'
      + #13 + #10 + 'Para sair ele deve ser confirmado ou cancelado.', mtError, [mbOK], 0);
    Action := caNone;
  end;
end;

procedure TFCupomFiscalCad.AtualizaSubTotal;
var
  wTotal: Real;
begin
//  fTotal := wTotal;
//  fSubTotal := wTotal + DMImpressoraFiscal.QCupomFiscalCabVAL_DESCONTO.Value
//    - DMImpressoraFiscal.QCupomFiscalCabVAL_DESPESAS.Value;
  DMImpressoraFiscal.QSomaCupom.Refresh;
  lbSubtotal.Caption := FormatFloat('#,##0.00', DMImpressoraFiscal.QSomaCupomVAL_TOTAL.Value);
  lbTotal.Caption := FormatFloat('#,##0.00', DMImpressoraFiscal.QSomaCupomVAL_TOTAL.Value
    - DMImpressoraFiscal.QCupomFiscalCabVAL_DESCONTO.Value
    + DMImpressoraFiscal.QCupomFiscalCabVAL_DESPESAS.Value);
end;


procedure TFCupomFiscalCad.btAddDescontoSubTotalClick(Sender: TObject);
var
  wValorDesconto: Real;
begin
  if FTefInputBox = nil then
    FTefInputBox := tFTefInputBox.Create(Application);
  FTefInputBox.configura('Informe o valor', 'Informe o valor do desconto sobre o SubTotal',
    true, false, 3, 14, 'VALOR', 0);
  if FTefInputBox.ShowModal = mrOk then
  begin
    with DMImpressoraFiscal do
    begin
      wValorDesconto := StrToFloat(FTefInputBox.edValor.Text);
      if wValorDesconto >= fSubTotal then
        raise Exception.Create('O valor do desconto deve ser menor que o valor total do cupom.');
      QCupomFiscalCab.RefreshRecord;
      QCupomFiscalCab.Edit;
      QCupomFiscalCabVAL_DESCONTO.Value := wValorDesconto;
      if not pSubtotalizado then
      begin
        if (MessageDlg('Depois de adicionar o valor de desconto não será mais possível alterar os itens.'
          + #13 + #10 + 'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then
          if FImpressoraFiscal.SubTotalizaCupom then
            pSubtotalizado := True;
      end;
      if FImpressoraFiscal.AdicionaDescontoSubtotal then
      begin
        QCupomFiscalCab.Post;
        AtualizaSubTotal;
      end
      else
        QCupomFiscalCab.Cancel;
    end;
  end;
end;

procedure TFCupomFiscalCad.btCancDescontoSubTotalClick(Sender: TObject);
begin
  if (MessageDlg('Deseja mesmo cancelar o desconto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    with DMImpressoraFiscal do
    begin
      if QCupomFiscalCabVAL_DESCONTO.Value = 0.00 then
        raise Exception.Create('Não é possivel cancelar.' + #13 + #10
          + 'O cupom não possui desconto.');
      if FImpressoraFiscal.CancelaDescontoSubtotal then
      begin
        QCupomFiscalCab.RefreshRecord;
        QCupomFiscalCab.Edit;
        QCupomFiscalCabVAL_DESCONTO.Value := 0.00;
        QCupomFiscalCab.Post;
        AtualizaSubTotal;
      end;
    end;
  end;
end;

procedure TFCupomFiscalCad.btAddDespesaSubTotalClick(Sender: TObject);
var
  wValorDespesas: Real;
begin
  if FTefInputBox = nil then
    FTefInputBox := tFTefInputBox.Create(Application);
  FTefInputBox.configura('Informe o valor', 'Informe o valor da despesa sobre o SubTotal',
    true, false, 3, 14, 'VALOR', 0);
  if FTefInputBox.ShowModal = mrOk then
  begin
    with DMImpressoraFiscal do
    begin
      wValorDespesas := StrToFloat(FTefInputBox.edValor.Text);
      if wValorDespesas >= fSubTotal then
        raise Exception.Create('O valor de despesas deve ser menor que o valor do subTotal do cupom.');
      QCupomFiscalCab.RefreshRecord;
      QCupomFiscalCab.Edit;
      QCupomFiscalCabVAL_DESPESAS.Value := wValorDespesas;
      if not pSubtotalizado then
      begin
        if (MessageDlg('Depois de adicionar o valor de despesas não será mais possível alterar os itens.'
          + #13 + #10 + 'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) in [mrYes]) then
          if FImpressoraFiscal.SubTotalizaCupom then
            pSubtotalizado := True;
      end;
      if FImpressoraFiscal.AdicionaDespesasSubtotal then
      begin
        QCupomFiscalCab.Post;
        AtualizaSubTotal;
      end
      else
        QCupomFiscalCab.Cancel;
    end;
  end;
end;

procedure TFCupomFiscalCad.btCancDespesaSubTotalClick(Sender: TObject);
begin
 if (MessageDlg('Deseja mesmo cancelar o valor de despesas?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    with DMImpressoraFiscal do
    begin
      if QCupomFiscalCabVAL_DESPESAS.Value = 0.00 then
        raise Exception.Create('Não é possivel cancelar.' + #13 + #10
          + 'O cupom não possui despesas.');
      if FImpressoraFiscal.CancelaDespesasSubtotal then
      begin
        QCupomFiscalCab.RefreshRecord;
        QCupomFiscalCab.Edit;
        QCupomFiscalCabVAL_DESPESAS.Value := 0.00;
        QCupomFiscalCab.Post;
        AtualizaSubTotal;
      end;
    end;
  end;
end;

procedure TFCupomFiscalCad.AtualizaEstadoBotoes;
var
  wCancelarItemAtivo, wDigitando: Boolean;
begin
  with DMImpressoraFiscal do
  begin
    wDigitando := (DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value = '1');
    wCancelarItemAtivo := (QCupomFiscalItemIND_CANC_ITEM_CF.Value = 'N') and
      (DMImpressoraFiscal.QCupomFiscalCab.RecordCount > 0) and wDigitando and (not pSubtotalizado);
    btCancelarItem.Enabled := wCancelarItemAtivo;
    btAdicinaDesconto.Enabled := wCancelarItemAtivo and (QCupomFiscalItemVAL_DESCONTO.Value = 0);
    btCancelaDescontoItem.Enabled:= wCancelarItemAtivo and (QCupomFiscalItemVAL_DESCONTO.Value > 0);
  end;
  btFecharCupom.Enabled := wDigitando and (DMImpressoraFiscal.QCupomFiscalItem.RecordCount > 0);
end;

procedure TFCupomFiscalCad.DsItensDataChange(Sender: TObject;
  Field: TField);
begin
  AtualizaEstadoBotoes;
end;

procedure TFCupomFiscalCad.btFecharCupomClick(Sender: TObject);
var
  wMsg, wDesconto, wNome, wTipoDesconto, wVendedor, wEntrada, wCondicao,
  wReceber1, wReceber2,wReceber3, wReceber4, wAcrescimo, wAcreDesc: String;
  wSubtotal: Real;
  wCartao,i: Integer;
  wFinaliza: Boolean;
  wQtdeRegistros,wData,wHora: String;
  wCodigo: Integer;
  wNumeroNota: Integer;
begin
  wNumeroNota := 0;
  setStatus('Verificando se o cupom fiscal está aberto...');
  if not FImpressoraFiscal.cupomAberto then
  begin
    with DMImpressoraFiscal do
    begin
      QCupomFiscalCab.Edit;
      QCupomFiscalCabIND_SITUACAO.Value := '3';
      QCupomFiscalCab.Post;
    end;
    setStatus('Aguardando comando...');
    sbIniciarVenda.Enabled := false;
    sbCancelarVenda.Enabled := false;
    btFecharCupom.Enabled := false;
    sbVerifica.Enabled := true;
    setStatus('Aguardando comando...');
    MessageDlg('Falha de comunicação ou impressora bloqueada. O cupom foi cancelado.',
      mtError,[mbok],0);
    Abort;
  end;
  setStatus('Subtotalizando cupom...');
  if not FImpressoraFiscal.SubTotal(wSubtotal) then
  begin
    setStatus('Aguardando comando...');
    Abort;
  end;
  if wSubtotal <= 0.009 then
  begin
    if (MessageDlg('O valor do cupom fiscal é 0(zero).' + #13 +#10
      + 'Se ele for fechado, será cancelado automaticamente.' + #13 + #10
      +'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then
      Abort;
    setStatus('Cancelando cupom...');
    if not FImpressoraFiscal.CancelaCupom then
    begin
      setStatus('Aguardando comando...');
      abort;
    end;
    DMImpressoraFiscal.QCupomFiscalCab.Edit;
    DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value := '3';
    DMImpressoraFiscal.QCupomFiscalCab.Post;
    setStatus('Aguardando comando...');
    Exit;
  end;
  setStatus('Fechamento do cupom fiscal...');
  if FCupomFiscalFechamento = nil then
    FCupomFiscalFechamento := TFCupomFiscalFechamento.Create(Application);
  //FCupomFiscalFechamento.gbKmPlaca.Visible := DMParamSistema.QParamSistemaIND_POSTO_COMBUSTIVEL.Value = 'S';
  if FCupomFiscalFechamento.ShowModal = mrOK then
  begin
    Try
      //Verifica se tem nota manual e faz validação
      if FCupomFiscalFechamento.cbNotaManual.Checked then
      begin
        with FCupomFiscalFechamento do
        begin
          if Trim(MESerie.Text) = '' then
          begin
            MessageDlg('Série de nota manual não informada.', mtError,[mbok],0);
            Abort;
          end;
          if Trim(MEModelo.Text) = '' then
          begin
            MessageDlg('Modelo de nota manual não informado.', mtError,[mbok],0);
            Abort;
          end;
          if DMOracle.FastSelect('COUNT(*)','TB_SERIE','COD_SERIE = '+
            QuotedStr(Trim(MESerie.Text)) + ' AND COD_SERIE_MODELO = ' +
            QuotedStr(Trim(MEModelo.Text))) = '0' then
          begin
            MessageDlg('Série não cadastrada no sistema.', mtError,[mbok],0);
            Abort;
          end;
          if Trim(FmOperacao1.MeOperacao.Text) = '' then
          begin
            MessageDlg('Operação não informada.', mtError,[mbok],0);
            Abort;
          end;
        end;
      end;
      setStatus('Verificando se o cupom fiscal está aberto...');
      if not FImpressoraFiscal.cupomAberto then
      begin
        with DMImpressoraFiscal do
        begin
          QCupomFiscalCab.Edit;
          QCupomFiscalCabIND_SITUACAO.Value := '3';
          QCupomFiscalCab.Post;
        end;
        setStatus('Aguardando comando...');
        sbIniciarVenda.Enabled := false;
        sbCancelarVenda.Enabled := false;
        btFecharCupom.Enabled := false;
        sbVerifica.Enabled := true;
        setStatus('Aguardando comando...');
        MessageDlg('Falha de comunicação ou impressora bloqueada. O cupom foi cancelado.',
          mtError,[mbok],0);
        Abort;
      end;
      with DMImpressoraFiscal do
      begin
        QCupomFiscalCab.Edit;
        QCupomFiscalCabVAL_DESCONTO.Value := StrToFloat('0' +
          bib.LimpaNumero(Trim(FCupomFiscalFechamento.edDesconto.Text),true));
        QCupomFiscalCabVAL_DESPESAS.Value := StrToFloat('0' +
          bib.LimpaNumero(Trim(FCupomFiscalFechamento.edDespesa.Text),true));
        QCupomFiscalCab.Post;
        setStatus('Totalizando cupom fiscal...');
        if not FImpressoraFiscal.IniciaFechamento then
        begin
          setStatus('Aguardando comando...');
          Abort;
        end;
        QCupomFiscalCab.Edit;
        QCupomFiscalCabIND_CUPOM_TOTALIZADO.Value := 'S';
        QCupomFiscalCab.Post;
        QPagamento.First;
        setStatus('Gravando pagamentos...');
        DMOracle.DBCemapa.StartTransaction; //controle serve para as parcelas do contas a receber e os lançamentos do caixa.
        while not QPagamento.Eof do
        begin
          if QPagamentoDESC_PAGAMENTO.Value = 'A PRAZO' then
            DMImpressoraFiscal.GeraContaReceber(FCupomFiscalFechamento.pParcelas, FCupomFiscalFechamento.pFinalidade,
              FCupomFiscalFechamento.pDepartamento, FCupomFiscalFechamento.pContaCorrente);
          if (QPagamentoDESC_PAGAMENTO.Value = 'DINHEIRO') or (QPagamentoDESC_PAGAMENTO.Value = 'CHEQUE') then
            AtuCaixa(QPagamentoVAL_PAGAMENTO.Value, QCupomFiscalCabCOD_OPERACAO.AsString,
              QCupomFiscalCabCOD_FILIAL.AsString, QCupomFiscalCabNUM_NOTA.AsString,
              QCupomFiscalCabCOD_CADASTRO.AsString, QCupomFiscalCabCOD_NOTA_CAB.AsString,
              QPagamentoDESC_PAGAMENTO.Value,
              StrToDate(FormatDateTime('DD/MM/YYYY',QCupomFiscalCabDT_EMISSAO.Value)));
          if QPagamentoDESC_PAGAMENTO.Value = 'CARTAO CREDITO' then
            wCartao := 3;
          if QPagamentoDESC_PAGAMENTO.Value = 'CARTAO DEBITO' then
            wCartao := 2;
          //Chama emissão TEF
          if (QPagamentoDESC_PAGAMENTO.Value = 'CARTAO CREDITO') or
            (QPagamentoDESC_PAGAMENTO.Value = 'CARTAO DEBITO') then
          begin
            //Guarda no registro o códiogo da filial
            //para o caso de dar erro na impressão do TEF
            Registry := TRegistry.Create;//executa o tregistry
            Registry.RootKey:=HKEY_CURRENT_USER; //abre a chave mestra
            Registry.OpenKey('SOFTWARE\CemapaSistema',true);
            Registry.WriteString('FilialTEF',QCupomFiscalCabCOD_FILIAL.Text);

            if FImpressoraFiscal.cupomAberto then
            begin
              if FTef = nil then
                FTef := TFTef.Create(Application);
              FTEF.ValorTransacao := QPagamentoVAL_PAGAMENTO.Value;
              FTEF.Modalidade := wCartao;
              FTEF.NumNota := QCupomFiscalCabNUM_NOTA.Text;
              FTEF.CodNotaCab := QCupomFiscalCabCOD_NOTA_CAB.Value;
              FTEF.btIniciaTef.Visible := true;
              if FTEF.Comprovantes = nil then
                FTEF.Comprovantes := TStringList.Create;
              FTEF.lbMensagem.Caption := '';
              FTEF.ValorDinheiro := 0;
              FTEF.ValorDesconto := 0;
              FTEF.FormaPagamento := QPagamentoDESC_PAGAMENTO.Value;
              FTEF.IndPaf := true;

              if FTEF.ShowModal = mrOk then
              begin
                with DMTEF do
                begin
                  if not QTefCab.Eof then
                  begin
                    QTefCab.Edit;
                    QTefCabIND_STATUS.Value := 'PENDENTE';
                    QTefCabDT_EMISSAO.Value := Now;
                    QTefCab.Post;
                  end;
                end;
              end
              else
              begin
                if FImpressoraFiscal.cupomAberto then
                begin
                  if FImpressoraFiscal.CancelaCupom then
                  begin
                    QCupomFiscalCab.Edit;
                    QCupomFiscalCabIND_SITUACAO.Value := '3';
                    QCupomFiscalCab.Post;
                  end;
                  DMOracle.DBCemapa.Rollback;
                  FTEF.Finaliza(FINALIZA_CANCELANDO);
                  setStatus('Aguardando comando...');
                  Abort;
                end
                else
                begin
                  QCupomFiscalCab.Edit;
                  QCupomFiscalCabIND_SITUACAO.Value := '3';
                  QCupomFiscalCab.Post;
                  sbIniciarVenda.Enabled := false;
                  sbCancelarVenda.Enabled := false;
                  btFecharCupom.Enabled := false;
                  sbVerifica.Enabled := true;
                  setStatus('Aguardando comando...');
                  MessageDlg('Falha de comunicação ou impressora bloqueada. O cupom foi cancelado.',
                    mtError,[mbok],0);
                  Abort;
                end;
              end;
            end
            else
            begin
              with DMImpressoraFiscal do
              begin
                QCupomFiscalCab.Edit;
                QCupomFiscalCabIND_SITUACAO.Value := '3';
                QCupomFiscalCab.Post;
              end;
              sbIniciarVenda.Enabled := false;
              sbCancelarVenda.Enabled := false;
              btFecharCupom.Enabled := false;
              sbVerifica.Enabled := true;
              setStatus('Aguardando comando...');
              MessageDlg('Falha de comunicação ou impressora bloqueada. O cupom foi cancelado.',
                mtError,[mbok],0);
              Abort;
            end;
          end;
          //fim TEF

          if Not FImpressoraFiscal.EfetuaFormaPagamento(QPagamentoDESC_PAGAMENTO.Value, QPagamentoVAL_PAGAMENTO.Value) then
          begin
            setStatus('Aguardando comando...');
            DMOracle.DBCemapa.Rollback;
            QCupomFiscalCab.Edit;
            QCupomFiscalCabIND_SITUACAO.Value := '3';
            QCupomFiscalCab.Post;
            if (QPagamentoDESC_PAGAMENTO.Value = 'CARTAO CREDITO') or
            (QPagamentoDESC_PAGAMENTO.Value = 'CARTAO DEBITO') then
            begin
              FTEF.Finaliza(FINALIZA_CANCELANDO);
            end;
            sbIniciarVenda.Enabled := false;
            sbCancelarVenda.Enabled := false;
            btFecharCupom.Enabled := false;
            sbVerifica.Enabled := true;
            Abort;
          end;
          QPagamento.Next;
        end;
        DMOracle.DBCemapa.Commit;
        //setStatus('Atualizando estoque...');
        DMImpressoraFiscal.AtualizaEstoque(-1);
        wMsg := '';
        //Mensagens Promocionais

        wMsg := '';
        i:=1;
        while(i < Length(QCupomFiscalCabOBS_COMPLEMENTO.Text)) do
        begin
          wMsg := wMsg+bib.AjustaStr(copy(QCupomFiscalCabOBS_COMPLEMENTO.Text,i,48),48,' ');
          i:= Length(wMsg);
        end;
        wMsg:=wMsg+Copy(('Val. Total Aprox. Trib.:'+ FormatFloat( '#,##0.00',QSomaCupomVAL_TOTAL_TRIB.Value)  + ' Fonte: IBPT                                    '),1,48);

        wReceber1 := '';
        wReceber2 := '';
        wReceber3 := '';
        wReceber4 := '';
        QContaReceber.Close;
        QContaReceber.SetVariable('NOTA_CAB', QCupomFiscalCabCOD_NOTA_CAB.Value);
        QContaReceber.Open;
        QContaReceber.First;
        While not QContaReceber.Eof Do
        Begin
          If QContaReceberNum_Parcela.Value = 1 Then
            wReceber1 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          If QContaReceberNum_Parcela.Value = 2 Then
            wReceber1 := wReceber1 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          If QContaReceberNum_Parcela.Value = 3 Then
            wReceber2 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          If QContaReceberNum_Parcela.Value = 4 Then
            wReceber2 := wReceber2 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          If QContaReceberNum_Parcela.Value = 5 Then
            wReceber3 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          If QContaReceberNum_Parcela.Value = 6 Then
            wReceber3 := wReceber3 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          If QContaReceberNum_Parcela.Value = 7 Then
            wReceber4 := DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          If QContaReceberNum_Parcela.Value = 8 Then
            wReceber4 := wReceber4 + '     ' + DateToStr(QContaReceberDt_Vencimento.Value)+' - '+FormatFloat('0.00',QContaReceberVal_Titulo.Value);
          QContaReceber.Next;
        End;
        QContaReceber.Close;

        wMsg := wMsg + IfThen(wReceber1 = '','', bib.FormataTexto(wReceber1,48)) +
                IfThen(wReceber2 = '','', bib.FormataTexto(wReceber2,48)) +
                IfThen(wReceber3 = '','', bib.FormataTexto(wReceber3,48)) +
                IfThen(wReceber4 = '','', bib.FormataTexto(wReceber4,48));
        if FCupomFiscalFechamento.cbNotaManual.Checked then
        begin
          wNumeroNota := DMSerie.NumeroSerie(QCupomFiscalCabCOD_FILIAL.Value,
            FCupomFiscalFechamento.MESerie.Text, FCupomFiscalFechamento.MEModelo.Text);
          wMsg := bib.FormataTexto('NF: '+ IntToStr(wNumeroNota),48) + wMsg;
        end;

        setStatus('Terminando fechamento cupom...');
        if not FImpressoraFiscal.TerminaFechamentoCupom(wMsg) then
        begin
          setStatus('Aguardando comando...');
          DMOracle.DBCemapa.Rollback;
          Abort;
        end;

        QPagamento.First;
        while not QPagamento.Eof do
        begin
          if (QPagamentoDESC_PAGAMENTO.Value = 'CARTAO CREDITO') or
              (QPagamentoDESC_PAGAMENTO.Value = 'CARTAO DEBITO') then
          begin
            wFinaliza := true;
            if (Assigned(FTEF.Comprovantes)) and (FTEF.Comprovantes.Count > 0) then
            begin
              wFinaliza := FTEF.ImprimeTransacaoTEF;
              FTEF.Comprovantes.Clear;
            end;
            if wFinaliza then
            begin
              FImpressoraFiscal.InsereDemaisDocumentos('CC',QCupomFiscalCabCOD_NOTA_CAB.Value);
              FTEF.Finaliza(FINALIZA_CONFIRMANDO);
            end
            else
            begin
              FTEF.Finaliza(FINALIZA_CANCELANDO);
              FTEF.FormStyle := fsNormal;
              MessageDlg('Transação não foi efetuada. Favor reter o Cupom.', mtError, [mbOK], 0);
              FTEF.FormStyle := fsStayOnTop;
              sbCancelarVendaClick(Self);
            end;
            break;
          end;
          QPagamento.Next;
        end;
        QCupomFiscalCab.Edit;
        QCupomFiscalCabIND_SITUACAO.Value := '2';
        QCupomFiscalCab.Post;
        DMOracle.DBCemapa.Commit;
        setStatus('Aguardando comando...');
        //Atualiza estoque diario
        FImpressoraFiscal.AtualizaEstoqueDiario;

        //Se chegou aqui é porque confirmou o cupom
        //Gera nota manual se for o caso
        QNotaManualCab.Open;
        if FCupomFiscalFechamento.cbNotaManual.Checked then
        begin
          QNotaManualCab.insert;
          QNotaManualCabCOD_USUARIO.Value := QCupomFiscalCabCOD_USUARIO.Value;
          QNotaManualCabCOD_FILIAL.Value := QCupomFiscalCabCOD_FILIAL.Value;
          QNotaManualCabCOD_OPERACAO.Value := StrToInt(Trim(FCupomFiscalFechamento.FmOperacao1.MeOperacao.Text));
          QNotaManualCabCOD_ESTADO.Value := QCupomFiscalCabCOD_ESTADO.Value;
          QNotaManualCabCOD_VENDEDOR.Value := QCupomFiscalCabCOD_VENDEDOR.Value;
          QNotaManualCabCOD_CADASTRO.Value := QCupomFiscalCabCOD_CADASTRO.Value;
          QNotaManualCabNUM_NOTA.Value := wNumeroNota;
          QNotaManualCabCOD_SERIE.Value := FCupomFiscalFechamento.MESerie.Text;
          QNotaManualCabIND_SITUACAO.Value := QCupomFiscalCabIND_SITUACAO.Value;
          QNotaManualCabIND_CONDICAO_PAGTO.Value := QCupomFiscalCabIND_CONDICAO_PAGTO.Value;
          QNotaManualCabDT_EMISSAO.Value := QCupomFiscalCabDT_EMISSAO.Value;
          QNotaManualCabDT_MOVIMENTO.Value := QCupomFiscalCabDT_MOVIMENTO.Value;
          QNotaManualCabDT_RECEBIMENTO.Value := QCupomFiscalCabDT_RECEBIMENTO.Value;
          QNotaManualCabVAL_DESPESAS.Value := QCupomFiscalCabVAL_DESPESAS.Value;
          QNotaManualCabIND_ENTRADA_SAIDA.Value := QCupomFiscalCabIND_ENTRADA_SAIDA.Value;
          QNotaManualCabVAL_DESCONTO.Value := QCupomFiscalCabVAL_DESCONTO.Value;
          QNotaManualCabCOD_SERIE_MODELO.Value := FCupomFiscalFechamento.MEModelo.Text;
          QNotaManualCabVAL_FRETE.Value := QCupomFiscalCabVAL_FRETE.Value;
          QNotaManualCabNUM_COO.Value := QCupomFiscalCabNUM_COO.Value;
          QNotaManualCabDT_USUARIO.Value := QCupomFiscalCabDT_USUARIO.Value;
          QNotaManualCabVAL_ICM_FRETE.Value := QCupomFiscalCabVAL_ICM_FRETE.Value;
          QNotaManualCabVAL_ICM_BASE_FRETE.Value := QCupomFiscalCabVAL_ICM_BASE_FRETE.Value;
          QNotaManualCabVAL_FUNRURAL.Value := QCupomFiscalCabVAL_FUNRURAL.Value;
          QNotaManualCabNUM_SERIE_ECF.Value := QCupomFiscalCabNUM_SERIE_ECF.Value;
          QNotaManualCab.Post;
          //Itens
          QCupomFiscalItem.First;
          QNotaManualItem.Open;
          while not QCupomFiscalItem.Eof do
          begin
            if QCupomFiscalItemIND_CANC_ITEM_CF.Value = 'S' then
            begin
              QCupomFiscalItem.Next;
              Continue;
            end;
            QNotaManualItem.Insert;
            QNotaManualItemCOD_NOTA_CAB.Value :=  QNotaManualCabCOD_NOTA_CAB.Value;
            QNotaManualItemCOD_TRIBUTACAO.Value := QCupomFiscalItemCOD_TRIBUTACAO.Value;
            QNotaManualItemQT_QUANTIDADE.Value := QCupomFiscalItemQT_QUANTIDADE.Value;
            QNotaManualItemVAL_TOTAL.Value := QCupomFiscalItemVAL_TOTAL.Value;
            QNotaManualItemPERC_IPI.Value := QCupomFiscalItemPERC_IPI.Value;
            QNotaManualItemPERC_COMISSAO.Value := QCupomFiscalItemPERC_COMISSAO.Value;
            QNotaManualItemCOD_PRODUTO.Value := QCupomFiscalItemCOD_PRODUTO.Value;
            QNotaManualItemCOD_LOTE_TIPO.Value := QCupomFiscalItemCOD_LOTE_TIPO.Value;
            QNotaManualItemVAL_DESCONTO.Value := QCupomFiscalItemVAL_DESCONTO.Value;
            QNotaManualItemVAL_DESPESAS.Value := QCupomFiscalItemVAL_DESPESAS.Value;
            QNotaManualItemPERC_DESCONTO.Value := QCupomFiscalItemPERC_DESCONTO.Value;
            QNotaManualItemVAL_IPI.Value := QCupomFiscalItemVAL_IPI.Value;
            QNotaManualItemVAL_UNITARIO.Value := QCupomFiscalItemVAL_UNITARIO.Value;
            QNotaManualItemVAL_ICM_BASE.Value := QCupomFiscalItemVAL_ICM_BASE.Value;
            QNotaManualItemVAL_ICM.Value := QCupomFiscalItemVAL_ICM.Value;
            QNotaManualItemIND_CLASS_IPI.Value := QCupomFiscalItemIND_CLASS_IPI.Value;
            QNotaManualItemVAL_CUSTO.Value := QCupomFiscalItemVAL_CUSTO.Value;
            QNotaManualItemVAL_ISS.Value := QCupomFiscalItemVAL_ISS.Value;
            QNotaManualItemVAL_DESCONTO_RATEIO.Value := QCupomFiscalItemVAL_DESCONTO_RATEIO.Value;
            QNotaManualItemVAL_FRETE.Value := QCupomFiscalItemVAL_FRETE.Value;
            QNotaManualItem.Post;
            QCupomFiscalItem.Next;
          end;
        end;
      end;
    Except
      on e: Exception do
      begin
        MessageDlg('Erro: '  + e.Message + #13#10 +
        'O cupom será cancelado.',mtError,[mbok],0);
        FImpressoraFiscal.CancelaCupom;
        //if DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value <> '3' then
//        begin
          //Atualiza a query para evitar erros de concorrencia
          wCodigo := DMImpressoraFiscal.QCupomFiscalCabCOD_NOTA_CAB.Value;
          DMImpressoraFiscal.QCupomFiscalCab.Close;
          DMImpressoraFiscal.QCupomFiscalItem.Close;
          DMImpressoraFiscal.QCupomFiscalCab.
            SetVariable('PK',wCodigo);
          DMImpressoraFiscal.QCupomFiscalCab.Open;
          DMImpressoraFiscal.QCupomFiscalItem.Open;

          DMImpressoraFiscal.QCupomFiscalCab.Edit;
          DMImpressoraFiscal.QCupomFiscalCabIND_SITUACAO.Value := '3';
          DMImpressoraFiscal.QCupomFiscalCab.Post;
        //end;
        setStatus('Aguardando comando...');
        Abort;
      end;
    end;
    end
    else
    begin
      with DMImpressoraFiscal do
      begin
        setStatus('Cancelando cupom...');
        if FImpressoraFiscal.CancelaCupom then
        begin
          QCupomFiscalCab.Edit;
          QCupomFiscalCabIND_SITUACAO.Value := '3';
          QCupomFiscalCab.Post;
        end;
        setStatus('Aguardando comando...');
      end;
    end;
    AtualizaSubTotal;
    if wNumeroNota > 0 then
      MessageDlg('Nota número ' + IntToStr(wNumeroNota) +
        ' foi gerada com sucesso.', mtInformation,[mbOk],0);
end;



Procedure TFCupomFiscalCad.Analisa_iRetorno();
Begin
    if iRetorno = 0 then
       Application.MessageBox( 'Erro de Comunicação !', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -1 Then
       Application.MessageBox( 'Erro de Execução na Função. Verifique!', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -2  then
       Application.MessageBox( 'Parâmetro Inválido !', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -3  then
       Application.MessageBox( 'Alíquota não programada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -4 Then
       Application.MessageBox( 'Arquivo BemaFI32.INI não encontrado. Verifique!', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -5 Then
       Application.MessageBox( 'Erro ao Abrir a Porta de Comunicação', 'Erro',
                                MB_IconError + MB_OK);

    If iRetorno = -6 Then
       Application.MessageBox( 'Impressora Desligada ou Desconectada', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -7 Then
       Application.MessageBox( 'Banco Não Cadastrado no Arquivo BemaFI32.ini', 'Atenção',
                                MB_IconInformation + MB_OK);

    If iRetorno = -8 Then
       Application.MessageBox( 'Erro ao Criar ou Gravar no Arquivo Retorno.txt ou Status.txt', 'Erro',
                                MB_IconError + MB_OK);

    if iRetorno = -18 then
       Application.MessageBox( 'Não foi possível abrir arquivo INTPOS.001 !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -19 then
       Application.MessageBox( 'Parâmetro diferentes !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -20 then
       Application.MessageBox( 'Transação cancelada pelo Operador !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -21 then
       Application.MessageBox( 'A Transação não foi aprovada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -22 then
       Application.MessageBox( 'Não foi possível terminal a Impressão !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -23 then
       Application.MessageBox( 'Não foi possível terminal a Operação !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -24 then
       Application.MessageBox( 'Forma de pagamento não programada.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -25 then
       Application.MessageBox( 'Totalizador não fiscal não programado.', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -26 then
       Application.MessageBox( 'Transação já Efetuada !', 'Atenção',
                                MB_IconInformation + MB_OK);

    if iRetorno = -28 then
       Application.MessageBox( 'Não há Informações para serem Impressas !', 'Atenção',
                                MB_IconInformation + MB_OK);

end;


procedure TFCupomFiscalCad.FormActivate(Sender: TObject);
begin
  AtualizaSubTotal;
  //gbKmPlaca.Visible := DMParamSistema.QParamSistemaIND_POSTO_COMBUSTIVEL.Value = 'S';
end;

procedure TFCupomFiscalCad.DBGItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  //if Column.Field.as = 'desc_cancelado' then
  //begin
    if DMImpressoraFiscal.QCupomFiscalItemdesc_cancelado.AsString = 'CANCELADO' then
    begin
      DBGItens.Canvas.Font.Style := DBGItens.Canvas.Font.Style + [fsBold];
      DBGItens.Canvas.Font.Color := clWhite;
      DBGItens.Canvas.Brush.Color := clRed;
      DBGItens.DefaultDrawDataCell(Rect, Column.Field, State);
    end;
  //end;
end;

procedure TFCupomFiscalCad.mostraGT;
var
  wGT: String;
  wTeste: Boolean;
begin
 { wTeste := FImpressoraFiscal.getGT(wGT);
  if not wTeste then
    Abort;
  ShowMessage(wGT);}
end;

procedure TFCupomFiscalCad.BloqueiaTela;
begin

end;

procedure TFCupomFiscalCad.acAbreMenuFiscalExecute(Sender: TObject);
begin
  if FImpressoraFiscal = nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

procedure TFCupomFiscalCad.setStatus(pMensagem: String);
begin
  StatusBar.Panels[2].Text := pMensagem;
  Application.ProcessMessages;
end;

procedure TFCupomFiscalCad.AbreUltimoCupomFiscal;
var
  wData, wHora, wMaxNotaCab: String;
begin
  if not FImpressoraFiscal.getDataHoraImpressora(wData, wHora) then
    Abort;
  wData := copy(wData, 1, 2) + '/' + copy(wData, 3, 2) + '/20' + copy(wData, 5, 2);
  wMaxNotaCab := trim(DMOracle.FastSelect('MAX(COD_NOTA_CAB)', 'TB_NOTA_CAB', 'NUM_SERIE_ECF = '
    + QuotedStr(FImpressoraFiscal.NumSerie) + 'AND DT_RECEBIMENTO = ' + QuotedStr(wData)));
  if wMaxNotaCab <> '' then
  begin
    DMImpressoraFiscal.QCupomFiscalCab.Close;
    DMImpressoraFiscal.QCupomFiscalCab.SetVariable('PK', StrToInt(wMaxNotaCab));
    DMImpressoraFiscal.QCupomFiscalCab.Open;
  end;
end;

procedure TFCupomFiscalCad.FormCreate(Sender: TObject);
begin
  DMImpressoraFiscal.QCupomFiscalCab.Open;
  DMImpressoraFiscal.QCupomFiscalItem.Open;
//  if FImpressoraFiscal = Nil then   //Apenas para instanciar a tela de impressora fiscal
//    FImpressoraFiscal := TFImpressoraFiscal.Create(Application)
//  else
//    FimpressoraFiscal.VerificaPAFECFLiberado;

  sbIniciarVenda.Enabled := FImpressoraFiscal.pPafEcfLiberado;
  sbVerifica.Enabled := not FImpressoraFiscal.pPafEcfLiberado;
  btNFe.Enabled := FImpressoraFiscal.pArqConfigValidado;

  if not FImpressoraFiscal.pPafEcfLiberado then
  begin
    MessageDlg('PAF-ECF está sem condições de emitir documentos fiscais!', mtError, [mbOK], 0);
    setStatus('PAF-ECF está sem condições de emitir documentos fiscais!');
  end
  else
    setStatus('Aguardando comando...');
  if FImpressoraFiscal.pPafEcfLiberado then
    AbreUltimoCupomFiscal;

  //----------------------------------------------------------------------------
  //Caso houver queda de energia
  with DMImpressoraFiscal,DMOracle do
  begin
    if QCupomFiscalCab.RecordCount > 0 then
    begin
      //Se efetuou a transação do TEF
      if Trim(FastSelect('IND_STATUS','TB_TEF_CAB','COD_NOTA_CAB = '+
        QCupomFiscalCabCOD_NOTA_CAB.Text)) = 'EFETUADA' then
      begin
        if QCupomFiscalCabIND_SITUACAO.Value <> '2' then
        begin
          QCupomFiscalCab.Edit;
          QCupomFiscalCabIND_SITUACAO.Value := '2';
          QCupomFiscalCab.Post;
          Abort; 
        end;
      end;
    end;
  end;
  //----------------------------------------------------------------------------
  if not FImpressoraFiscal.cupomAberto then
  begin
    with DMImpressoraFiscal do
    begin
      if QCupomFiscalCab.RecordCount > 0 {e ind_situacao <> 3} then
      begin
        QCupomFiscalCab.Edit;
        QCupomFiscalCabIND_SITUACAO.Value := '3';
        QCupomFiscalCab.Post;
        setStatus('Aguardando comando...');
        MessageDlg('O cupom fiscal foi cancelado.',mtError,[mbok],0);
        Abort;
      end;
    end;
  end;
  if FImpressoraFiscal.verificaCupomAberto then
  begin //Se cupom tiver aberto na impressora e cancelado no B.D.
    with DMImpressoraFiscal do
    begin
      if QCupomFiscalCab.RecordCount > 0 then
      begin
        if QCupomFiscalCabIND_SITUACAO.Value = '3' then
        begin
          if FImpressoraFiscal.CancelaCupom then
            MessageDlg('O cupom foi cancelado devido à situação estar diferente do sistema.',
              mtInformation,[mbOk],0);
          setStatus('Aguardando comando...');
        end
      end;
    end;
  end;
end;

procedure TFCupomFiscalCad.btNFeClick(Sender: TObject);
begin
  //if not FImpressoraFiscal.pArqConfigValidado then
//  begin
//    MessageDlg('Arquivo de configuração inválido ou não encontrado.',
//      mtError, [mbOk], 0);
//    Abort;
//  end;
//  if FPafNfeParam = Nil then
//    FPafNfeParam := TFPafNfeParam.Create(Application);
//  if Trim(DMImpressoraFiscal.QCupomFiscalCabCOD_NOTA_CAB.Text) <> '' then
//  begin
//    FPafNfeParam.FmNota1.MeNota.Text :=
//      DMImpressoraFiscal.QCupomFiscalCabCOD_NOTA_CAB.Text;
//    FPafNfeParam.FmNota1.MeNotaExit(Self);
//  end;
//  if FPafNfeParam.ShowModal = MrOk then
//  begin
//    if FNotaSaidaCad = Nil then
//      FNotaSaidaCad := TFNotaSaidaCad.Create(Application);
//    FNotaSaidaCad.StBLongHint.SimpleText := 'MENU FISCAL -> CTRL + ALT + F';
//    with DMNotaSaida, DMImpressoraFiscal do
//    begin
//      QNotaSaida.Open;
//      QItemNF.Open;
//
//      //Se escolher um cupom diferente do que já está carregado na query QCupomFiscalCab
//      if (FPafNfeParam.cbCupom.Checked) and
//        (Trim(FPafNfeParam.FmNota1.MeNota.Text) <> '') then
//      begin
//        QCupomFiscalCab.Close;
//        QCupomFiscalCab.SetVariable('PK',Trim(FPafNfeParam.FmNota1.MeNota.Text));
//        QCupomFiscalCab.Open;
//        if QCupomFiscalCab.RecordCount = 0 then
//        begin
//          MessageDlg('Cupom fiscal não existe', mtError, [mbOk], 0);
//          AbreUltimoCupomFiscal;
//          Abort;
//        end;
//        if QCupomFiscalCabIND_SITUACAO.Value = '3' then
//        begin
//          MessageDlg('Cupom fiscal cancelado', mtError, [mbOk], 0);
//          AbreUltimoCupomFiscal;
//          Abort;
//        end;
//      end;
//
//      if (QCupomFiscalCab.RecordCount > 0) and
//        (FPafNfeParam.cbCupom.Checked) then
//      begin
//        //Cabeçalho
//        QNotaSaida.Insert;
//        QNotaSaidaCOD_USUARIO.Value :=
//          QCupomFiscalCabCOD_USUARIO.Value;
//        QNotaSaidaCOD_FILIAL.Value :=
//          QCupomFiscalCabCOD_FILIAL.Value;
//        QNotaSaidaCOD_ESTADO.Value :=
//          QCupomFiscalCabCOD_ESTADO.Value;
//        QNotaSaidaCOD_VENDEDOR.Value :=
//          QCupomFiscalCabCOD_VENDEDOR.Value;
//        QNotaSaidaCOD_CADASTRO.Value :=
//          QCupomFiscalCabCOD_CADASTRO.Value;
//        QNotaSaidaDT_MOVIMENTO.Value :=
//          QCupomFiscalCabDT_MOVIMENTO.Value;
//        QNotaSaidaDT_RECEBIMENTO.Value :=
//          QCupomFiscalCabDT_RECEBIMENTO.Value;
//        QNotaSaidaVAL_DESPESAS.Value :=
//          QCupomFiscalCabVAL_DESPESAS.Value;
//        QNotaSaidaIND_ENTRADA_SAIDA.Value :=
//          QCupomFiscalCabIND_ENTRADA_SAIDA.Value;
//        QNotaSaidaVAL_FRETE.Value :=
//          QCupomFiscalCabVAL_FRETE.Value;
//        QNotaSaidaVAL_DESCONTO.Value :=
//          QCupomFiscalCabVAL_DESCONTO.Value;
//        QNotaSaidaDT_USUARIO.Value :=
//          DMOracle.DataServ;
//        QNotaSaidaCOD_SERIE.Value := FPafNfeParam.Serie;
//        QNotaSaidaCOD_SERIE_MODELO.Value := '55';
//        QNotaSaidaCOD_OPERACAO.Text := FPafNfeParam.Operacao;
//        QNotaSaidaNUM_NOTA.Value := 0;
//        QNotaSaidaDESC_MD5_CUPOM_FISCAL.Value := 'MD5' +
//          bib.Decode(FImpressoraFiscal.getMD5ArqConfig);
//          
//        //Caso der problema de UK
//        try
//          QNotaSaida.Post;
//        Except
//          if (QNotaSaida.RecordCount > 0) and
//            (QItemNF.Active) and (QItemNF.RecordCount > 0) then
//          begin
//            FNotaSaidaCad.ShowModal;
//            Abort;
//          end;
//        end;
//        QNotaSaida.Edit;
//        //Itens
//        QCupomFiscalItem.First;
//        while not QCupomFiscalItem.Eof do
//        begin
//          QItemNF.Insert;
//          QItemNFCOD_NOTA_CAB.Value :=
//            QNotaSaidaCOD_NOTA_CAB.Value;
//          QItemNFCOD_TRIBUTACAO.Value :=
//            QCupomFiscalItemCOD_TRIBUTACAO.Value;
//          QItemNFQT_QUANTIDADE.Value :=
//            QCupomFiscalItemQT_QUANTIDADE.Value;
//          QItemNFVAL_TOTAL.Value :=
//            QCupomFiscalItemQT_QUANTIDADE.Value;
//          QItemNFPERC_IPI.Value :=
//            QCupomFiscalItemPERC_IPI.Value;
//          QItemNFPERC_COMISSAO.Value :=
//            QCupomFiscalItemPERC_COMISSAO.Value;
//          QItemNFCOD_PRODUTO.Value :=
//            QCupomFiscalItemCOD_PRODUTO.Value;
//          QItemNFCOD_LOTE_TIPO.Value :=
//            QCupomFiscalItemCOD_LOTE_TIPO.Value;
//          QItemNFVAL_DESCONTO.Value :=
//            QCupomFiscalItemVAL_DESCONTO.Value;
//          QItemNFVAL_DESPESAS.Value;
//            QCupomFiscalItemVAL_DESPESAS.Value;
//          QItemNFVAL_FRETE.Value :=
//            QCupomFiscalItemVAL_FRETE.Value;
//          QItemNFPERC_DESCONTO.Value :=
//            QCupomFiscalItemPERC_DESCONTO.Value;
//          QItemNFVAL_IPI.Value :=
//            QCupomFiscalItemVAL_IPI.Value;
//          QItemNFVAL_UNITARIO.Value :=
//            QCupomFiscalItemVAL_UNITARIO.Value;
//          QItemNFVAL_ICM_BASE.Value :=
//            QCupomFiscalItemVAL_ICM_BASE.Value;
//          QItemNFVAL_ICM.Value :=
//            QCupomFiscalItemVAL_ICM.Value;
//          QItemNFIND_CLASS_IPI.Value :=
//            QCupomFiscalItemIND_CLASS_IPI.Value;
//          QItemNFVAL_CUSTO.Value :=
//            QCupomFiscalItemVAL_CUSTO.Value;
//          QItemNFVAL_ISS.Value :=
//            QCupomFiscalItemVAL_ISS.Value;
//          QItemNFCOD_CST_PIS.Value :=
//            DMOracle.FastSelect('COD_CST_PIS_SAIDA', 'TB_PRODUTO',
//              'COD_PRODUTO = ' + QCupomFiscalItemCOD_PRODUTO.Text);
//          QItemNFCOD_CST_COFINS.Value :=
//            DMOracle.FastSelect('COD_CST_COFINS_SAIDA', 'TB_PRODUTO',
//              'COD_PRODUTO = ' + QCupomFiscalItemCOD_PRODUTO.Text);
//          QItemNFCOD_CST_IPI.Value :=
//            DMOracle.FastSelect('COD_CST_IPI', 'TB_PRODUTO',
//              'COD_PRODUTO = ' + QCupomFiscalItemCOD_PRODUTO.Text);
//          QItemNF.Post;
//          QCupomFiscalItem.Next;
//        end;
//        //Caso der problema de UK
//        try
//          QNotaSaida.Post;
//        Except
//          if QNotaSaida.RecordCount > 0 then
//          begin
//            FNotaSaidaCad.ShowModal;
//          end;
//        end;
//      end
//      else
//      begin
//        QNotaSaida.Insert;
//        QNotaSaidaCOD_SERIE.Value := FPafNfeParam.Serie;
//        QNotaSaidaCOD_SERIE_MODELO.Value := '55';
//        QNotaSaidaCOD_OPERACAO.Text := FPafNfeParam.Operacao;
//        QNotaSaidaNUM_NOTA.Value := 0;
//        QNotaSaidaDESC_MD5_CUPOM_FISCAL.Value := 'MD5' +
//          bib.Decode(FImpressoraFiscal.getMD5ArqConfig);
//        //Caso der problema de UK
//        try
//          QNotaSaida.Post;
//        Except
//          if QNotaSaida.RecordCount > 0 then
//          begin
//            FNotaSaidaCad.ShowModal;
//            Abort;
//          end;
//        end;
//        //if (QItemNF.Active) and (QItemNF.RecordCount > 0) then //Se for nota não originada de cupom
//          QNotaSaida.Edit;
//      end;
//      try
//        DMOracle.DBCemapa.Commit;
//        FNotaSaidaCad.ShowModal();
//      Except
//        on e: Exception do
//        begin
//          MessageDlg(e.Message, mtError, [mbOk], 0);
//          DMOracle.DBCemapa.Rollback;
//        end;
//      end;
//    end;
//    AbreUltimoCupomFiscal;
//  end;
end;

procedure TFCupomFiscalCad.MeValDescExit(Sender: TObject);
var wValor: String;
  wValorDouble: Double;
begin
  wValor := bib.LimpaString(MeValDesc.Text,'.');
  try
    wValorDouble := StrToFloat(wValor);
  Except
    MeValDesc.Text := '0,00';
  end;
  if wValorDouble < 0 then
  begin
    MessageDlg('Não é permitido informar valor nulo(zero) ou negativo!',
      mtError,[mbOk],0);
    MeValDesc.SetFocus;
    Abort;
  end;
  if wValorDouble >= (StrToFloat(bib.LimpaNumero(MeValUnitario.Text,True)) *
    StrToFloat(meQtde.Text)) then
  begin
    MessageDlg('Valor do desconto maior ou igual ao valor do item',
      mtError,[mbOk],0);
    MeValDesc.SetFocus;
    Abort;
  end;
  MeValDesc.Text :=
    FormatFloat('#,##0.00',
      StrToFloat(wValor));
  if(Trim(meProduto.Text) = '') or
    (Trim(meQtde.Text) = '') then
  begin
    MessageDlg('Dados incompletos.' + #13#10 +
      'Por favor preencha os dados corretamente antes de incluir o item.',
      mtError,[mbOk],0);
    Abort;
  end;
  if(Trim(meProduto.Text) <> '') and
      (Trim(meQtde.Text) <> '') then
  begin
    meProduto.SetFocus;
    meProduto.SelectAll;
    AddItem;
  end;
end;

procedure TFCupomFiscalCad.MePercDescExit(Sender: TObject);
var
  wValUnitario,wPercDesc: Double;
begin
  wValUnitario := 0;
  wPercDesc := 0;
  try
    MePercDesc.Text :=
      FormatFloat('#,##0.00',StrToFloat(MePercDesc.Text));
  Except
    MePercDesc.Text := '0,00'
  end;
  if StrToFloat(MePercDesc.Text) < 0 then
  begin
    MessageDlg('Não é permitido informar valor nulo(zero) ou negativo!',
      mtError,[mbOk],0);
    MePercDesc.SetFocus;
    Abort;
  end;
  if Trim(MePercDesc.Text) <> '0,00' then
  begin
    wPercDesc := StrToFloat(MePercDesc.Text);
    if Trim(MeProduto.Text) = '' then
    begin
      MessageDlg('Produto não informado', mtError, [mbOk],0);
      Abort;
    end;
    with DMImpressoraFiscal, DMOracle do
    begin
      wValUnitario := StrToFloat(FastSelect('NVL(VAL_VAREJO,0)','TB_PRODUTO',
        'DESC_COD_BARRA = ' + Trim(MeProduto.Text)));
      MeValDesc.Text := FormatFloat('#,##0.00',wValUnitario*wPercDesc/100);
    end;
  end;
end;

procedure TFCupomFiscalCad.meQtdeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin 
  if (key = VK_DOWN) and ((Trim(meProduto.Text) = '') or
    (Trim(meQtde.Text) = '')) then
  begin
    MessageDlg('Dados incompletos.' + #13#10 +
      'Por favor preencha os dados corretamente antes de incluir o item.',
      mtError,[mbOk],0);
    Abort;
  end;
  if (key = VK_DOWN) and (Trim(meProduto.Text) <> '') and
    (Trim(meQtde.Text) <> '') then
  begin
    meProduto.SetFocus;
    meProduto.SelectAll;
    AddItem;
  end;
end;

procedure TFCupomFiscalCad.MeValUnitarioChange(Sender: TObject);
begin
  if Trim(MeValUnitario.Text) <> '' then
    MeValUnitario.Text := FormatFloat('#,##0.00', StrToFloat(
      bib.LimpaString(MeValUnitario.Text,'.')));
end;

procedure TFCupomFiscalCad.acIniciarVenda(Sender: TObject);
begin
  if sbIniciarVenda.Enabled then
    sbIniciarVendaClick(Self)
  else
    MessageDlg('Não é possível iniciar cupom neste momento',
      mtInformation,[mbOk],0);
end;

procedure TFCupomFiscalCad.acCancelarVenda(Sender: TObject);
begin
  if sbCancelarVenda.Enabled then
    sbCancelarVendaClick(Self)
  else
    MessageDlg('Não é possível cancelar cupom neste momento',
      mtInformation,[mbOk],0);
end;

procedure TFCupomFiscalCad.acFecharCupom(Sender: TObject);
begin
  if btFecharCupom.Enabled then
    btFecharCupomClick(Self)
  else
    MessageDlg('Não é possível fechar cupom neste momento',
      mtInformation,[mbOk],0);
end;
procedure TFCupomFiscalCad.btMensagemConsClick(Sender: TObject);
begin
  with DMMensagem,DMImpressoraFiscal do
  begin
    if FMensagemCons = Nil then
      FMensagemCons := TFMensagemCons.Create(Application);
    if FMensagemCons.ShowModal = MrOk then
    begin
      QCupomFiscalCabOBS_COMPLEMENTO.Clear;
      QCupomFiscalCabOBS_COMPLEMENTO.Value :=
        Trim(QMensagemConsDESC_MENSAGEM.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO1.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO2.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO3.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO4.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO5.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO6.Value + ' ' +
        QMensagemConsDESC_COMPLEMENTO7.Value);         
    end;
  end;
end;

procedure TFCupomFiscalCad.sbVerificaClick(Sender: TObject);
begin
  if not FimpressoraFiscal.VerificaPAFECFLiberado then
    Abort;
  FormCreate(Self);
end;

procedure TFCupomFiscalCad.sbRelatorioClick(Sender: TObject);
var wNumSerie: String;
begin
  //if FCupomFiscalParam = Nil then
//    FCupomFiscalParam := TFCupomFiscalParam.Create(Application);
//  FCupomFiscalParam.PGRelatorio.Pages[0].TabVisible := true;
//  FCupomFiscalParam.Fm1Datas.MeDtInicial.Text :=
//    DateToStr(DMOracle.DataServ);
//  FCupomFiscalParam.Fm1Datas.MeDtFinal.Text :=
//    DateToStr(DMOracle.DataServ);
//  with DMImpressoraFiscal,FImpressoraFiscal do
//  begin
//    wNumSerie :=  NumSerie;
//    QECFCons.Close;
//    QECFCons.Open;
//    QECFCons.First;
//    while not QECFCons.Eof do
//    begin
//      if Trim(QECFConsNUM_SERIE.Value) = Trim(wNumSerie) then
//        break;
//      QECFCons.Next;
//    end;
//    if FCupomFiscalParam.ShowModal = MrOk then
//    begin
//      QCupomFiscalRel.Close;
//      QCupomFiscalRel.SetVariable('NUM_SERIE_ECF',
//        Trim(FCupomFiscalParam.db1NumSerieECF.Text));
//      QCupomFiscalRel.SetVariable('DT_INI',
//        Trim(FCupomFiscalParam.Fm1Datas.MeDtInicial.Text));
//      QCupomFiscalRel.SetVariable('DT_FIN',
//        Trim(FCupomFiscalParam.Fm1Datas.MeDtFinal.Text));
//      if Trim(FCupomFiscalParam.Me1Cupom.Text) <> '' then
//        QCupomFiscalRel.SetVariable('NUM_CUPOM',
//          FCupomFiscalParam.Me1Cupom.Text)
//      else
//        QCupomFiscalRel.SetVariable('NUM_CUPOM',null);
//      QCupomFiscalRel.Open;
//    end;
//    if QCupomFiscalRel.RecordCount = 0 then
//    begin
//      MessageDlg('Nenhum cupom encontrado', mtInformation,
//        [mbOk],0);
//      Abort;
//    end;
//    if FRCupomFiscal = Nil then
//      FRCupomFiscal := TFRCupomFiscal.Create(Self);
//    FRCupomFiscal.QRLPeriodo.Caption :=
//      'Período de ' + FCupomFiscalParam.Fm1Datas.MeDtInicial.Text +
//      ' até ' + FCupomFiscalParam.Fm1Datas.MeDtFinal.Text;
//
//    FRCupomFiscal.QRPrimario.Preview;
//  end;
end;

end.


