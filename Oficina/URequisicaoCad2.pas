unit URequisicaoCad2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, OracleNavigator, Grids, DBGrids,
  DBCtrls;

type
  TFRequisicaoCad2 = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBPanel5: TDBPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBPanel6: TDBPanel;
    DSRequisicao_item: TDataSource;
    DBPanel7: TDBPanel;
    DBPanel8: TDBPanel;
    DBPanel9: TDBPanel;
    DBPanel10: TDBPanel;
    DBPanel11: TDBPanel;
    DBPanel12: TDBPanel;
    EdCodBarras: TEdit;
    Label2: TLabel;
    OracleNavigator1: TOracleNavigator;
    DBGrid1: TDBGrid;
    DBPanel13: TDBPanel;
    SBValUnitario: TSpeedButton;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    SBMarcacaoCad: TSpeedButton;
    SBFinalizaMarcacao: TSpeedButton;
    SBBloquear: TSpeedButton;
    SBDesbloquear: TSpeedButton;
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel5DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel10DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel11DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel13DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3CodigoExit(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure DBPanel3BeforeConsulta(Sender: TObject);
    procedure DBPanel3AfterConsulta(Sender: TObject);
    procedure SBValUnitarioClick(Sender: TObject);
    procedure EdCodBarrasExit(Sender: TObject);
    procedure DBPanel7CodigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OracleNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBMarcacaoCadClick(Sender: TObject);
    procedure SBFinalizaMarcacaoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBBloquearClick(Sender: TObject);
    procedure SBDesbloquearClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRequisicaoCad2: TFRequisicaoCad2;

implementation

uses UOficina_cl, UOSCons, UFilialCons, UMecanicoCons, UVendedorCons,
  UComissaoCons, UOs_cl, UOracle_cl, URequisicaoCons, UOSMarcacao,
  UMarcacaoFinaliza, Math, USenha, UParamSistema_cl;

{$R *.dfm}

procedure TFRequisicaoCad2.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FOsCons;
  Classe := TFOsCons;
end;

procedure TFRequisicaoCad2.DBPanel5DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;
end;

procedure TFRequisicaoCad2.DBPanel10DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FMecanicoCons;
  Classe := TFMecanicoCons;
end;

procedure TFRequisicaoCad2.DBPanel11DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FVendedorCons;
  Classe := TFVendedorCons;
end;

procedure TFRequisicaoCad2.DBPanel13DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FComissaoCons;
  Classe := TFComissaoCons;
end;

procedure TFRequisicaoCad2.DBPanel3CodigoExit(Sender: TObject);
var wReq: string;
begin
  inherited;
  with DMOracle, DMOficina do
  begin
    //Validações
    if QRequisicaoCad2NUM_OS.Value > 0 then
    begin
      wReq := DMOracle.BuscaNome('SELECT NUM_REQUISICAO FROM TB_REQUISICAO',
        'NUM_OS = ' + QRequisicaoCad2NUM_OS.Text);
      if(wReq <> '') then
      begin
        MELocaliza.Text := wReq;
        MELocalizaExit(Sender);
        MessageDlg('Já existe uma requisição para esta O.S.',
          mtInformation, [mbOk],0);
      end;
      if (BuscaNome('SELECT IND_SITUACAO FROM TB_OS', 'NUM_OS = ' +
        QRequisicaoCad2NUM_OS.Text) = 'F') then
      begin
        MessageDlg('O.S. já está fechada.', mtError, [mbok],0);
        QRequisicaoCad2.Close;
        QRequisicaoCad2.SetVariable('PK',-1);
        QRequisicaoCad2.Open;
        Abort;
      end;
      QRequisicaoCad2COD_FILIAL.Text :=
        BuscaNome('SELECT COD_FILIAL FROM TB_OS', 'NUM_OS = ' +
        QRequisicaoCad2NUM_OS.Text);
      QRequisicaoCad2COD_VENDEDOR.Text :=
        BuscaNome('SELECT COD_VENDEDOR FROM TB_OS', 'NUM_OS = ' +
        QRequisicaoCad2NUM_OS.Text);
      QRequisicaoCad2desc_cadastro_os.Value :=
      BuscaNome('SELECT C.NOME FROM TB_OS OS INNER JOIN TB_CADASTRO C '+
        'ON C.COD_CADASTRO = OS.COD_CADASTRO ', 'OS.NUM_OS = ' +
        QRequisicaoCad2NUM_OS.Text);  
    end;
  end;
end;

procedure TFRequisicaoCad2.SBIncluirClick(Sender: TObject);
begin
  inherited;
  {if FOsCons = Nil then
    FOsCons := TFOsCons.Create(Application);
  if FOsCons.ShowModal = MrOk then
  begin
    DMOficina.QRequisicaoCad2NUM_OS.Value :=
      DMOs.QOSConsNUM_OS.Value;
    DBPanel3CodigoExit(Self);
    DBPanel6.SetFocus;
  end
  else}
    DBPanel3.SetFocus;
end;

procedure TFRequisicaoCad2.DBPanel3BeforeConsulta(Sender: TObject);
begin
  inherited;
  DBPanel3.SetFocus;
end;

procedure TFRequisicaoCad2.DBPanel3AfterConsulta(Sender: TObject);
begin
  inherited;
  DBPanel3CodigoExit(Self);
  DBPanel6.SetFocus;
end;

procedure TFRequisicaoCad2.SBValUnitarioClick(Sender: TObject);
var
  wUltCusto1 :String;
  wUltCusto2 :String;
  wUltVenda1 :String;
  wUltVenda2 :String;
begin
  inherited;
  with DMOficina do
  begin
    if QRequisicao_item2NUM_FABRICANTE.Value <> '' then
    begin
      wUltCusto1 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMO_CUSTO,0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_item2NUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 1');
      wUltCusto2 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMO_CUSTO, 0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_item2NUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 2');
      wUltVenda1 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMA_VENDA,0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_item2NUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 1');
      wUltVenda2 := DMOracle.BuscaNome('SELECT NVL(E.VL_ULTIMA_VENDA, 0) FROM ' +
          'TB_ESTOQUE E INNER JOIN TB_PRODUTO P ON E.COD_PRODUTO = P.COD_PRODUTO ',
          'P.NUM_FABRICANTE = ' + quotedStr(QRequisicao_item2NUM_FABRICANTE.Value) +
          ' AND E.COD_LOTE_TIPO = 1  AND E.COD_FILIAL = 2');
      if wUltCusto1 = '' then
        wUltCusto1 := '0';
      if wUltCusto2 = '' then
        wUltCusto2 := '0';
      if wUltVenda1 = '' then
        wUltVenda1 := '0';
      if wUltVenda2 = '' then
        wUltVenda2 := '0';

      ShowMessage('Filial 1: ' +
        'Custo ' +
        FormatFloat('#,##0.00',StrToFloat(wUltCusto1)) +
        '  Preço ' +
        FormatFloat('#,##0.00',StrToFloat(wUltVenda1)) +
        chr(13) +
        'Filial 2: ' +
        'Custo ' +
        FormatFloat('#,##0.00',StrToFloat(wUltCusto2)) +
        '  Preço ' +
        FormatFloat('#,##0.00',StrToFloat(wUltVenda2))
        );
    end;
    if (QRequisicao_item2VAL_UNITARIO.text <> '') then
    begin
      QRequisicao_item2Val_Unitario.value := StrToFloat(inputBox('Insira o Novo Valor Unitário', 'Valor:', ''));
      QRequisicao_item2Ind_Desconto.Value := 'S';
      //Se estiver alterando o preço de um item salvo anteriormente
      if QRequisicao_item2.State = DSBrowse then
      begin
        AtualizaValorItemReq(QRequisicao_item2COD_REQUISICAO_ITEM.Text,
          QRequisicao_item2Val_Unitario.Text);
        SBRefreshClick(Self);
      end;
    end;
  end;
end;


procedure TFRequisicaoCad2.EdCodBarrasExit(Sender: TObject);
var
  wCodProduto, wCodItem, wAuxValorUn, wNumFabricante, wCodBarras: String;
  wAchou: Boolean;
  wValorUn: Real;
begin
  inherited;
  if trim(EdCodBarras.Text) <> '' then
  begin
    wCodBarras := trim(EdCodBarras.Text);
    EdCodBarras.Clear;
    if not (DSRequisicao_Item.State in [DsEdit, DsInsert]) then
    begin
      EdCodBarras.SetFocus;
      raise Exception.Create('O registro não está em edição!' + chr(13) +'Clique no botão "+" antes de passar o código de barras!');
    end;
    wCodProduto := DMOracle.FastSelect('COD_PRODUTO', 'TB_PRODUTO', 'DESC_COD_BARRA = ' + QuotedStr(wCodBarras) + ' OR COD_PRODUTO = ' + QuotedStr(wCodBarras));
    EdCodBarras.Clear;
    if wCodProduto = '' then
    begin
      EdCodBarras.SetFocus;
      raise Exception.Create('O código de barra informado não corresponde a nenhum produto cadastrado.');
    end
    else
    begin
      wNumFabricante := DMOracle.FastSelect('NUM_FABRICANTE', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto);
      if wNumFabricante = '' then
      begin
        EdCodBarras.SetFocus;
        raise Exception.Create('O produto ' + wCodProduto + ' está cadastrado, porém não possui o número do fabricante informado, verifique.');
      end
      else
      begin
        DMOficina.QRequisicao_item2NUM_FABRICANTE.Value := wNumFabricante;
        DBPanel7CodigoExit(Self);
        DBPanel6.SetFocus;
      end;
    end;
  end;
end;

procedure TFRequisicaoCad2.DBPanel7CodigoExit(Sender: TObject);
begin
  inherited;
  if (DSRequisicao_Item.State in [DsEdit, DsInsert]) and
    (DMOficina.QRequisicao_item2NUM_FABRICANTE.Value <> '') then
  begin
    if Copy(DMOficina.QRequisicao_item2NUM_FABRICANTE.Value, 1, 2) = 'SI' then
      DMOficina.QRequisicao_item2COD_FILIAL.Value := 2;

    with DMOracle, DMOficina do
    begin
      if not (QRequisicao_item2.State in [DsInsert, DsEdit]) then
        QRequisicao_item2.Edit;
      QRequisicao_item2VAL_UNITARIO.Text :=
        BuscaNome('SELECT VAL_VAREJO FROM TB_PRODUTO','NUM_FABRICANTE = ' +
          quotedStr(QRequisicao_item2NUM_FABRICANTE.Value));
           //+ ' OR CAST(COD_PRODUTO as VARCHAR(15)) = ' + quotedStr(QRequisicao_item2NUM_FABRICANTE.Value)); //Buscar por NUM_FABRICANTE ou COD_PRODUTO. Junior-06/11/2013
      QRequisicao_item2COD_PRODUTO.Text :=
        BuscaNome('SELECT COD_PRODUTO FROM TB_PRODUTO','NUM_FABRICANTE = ' +
          quotedStr(QRequisicao_item2NUM_FABRICANTE.Value));
         // + ' OR CAST(COD_PRODUTO as VARCHAR(15)) = ' + quotedStr(QRequisicao_item2NUM_FABRICANTE.Value)); //Buscar por NUM_FABRICANTE ou COD_PRODUTO. Junior-06/11/2013
    end;

//    Raquel pediu para tirar a filial 2 e coloca Data da Ultima Compra. Vanessa 23/05/2016
//    ShowMessage('Filial: 01 - Quantidade: ' + DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_QUANTIDADE  FROM TB_PRODUTO, TB_ESTOQUE', ' TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
//      + ' AND TB_ESTOQUE.COD_LOTE_TIPO = 1 AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_item2NUM_FABRICANTE.Value) + CHR(39)
//      + ' AND TB_ESTOQUE.COD_FILIAL = 1') + CHR(13) + 'Filial: 02 - Quantidade: '
//      + (DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_QUANTIDADE  FROM TB_PRODUTO, TB_ESTOQUE', ' TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
//      + ' AND TB_ESTOQUE.COD_LOTE_TIPO = 1 AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_item2NUM_FABRICANTE.Value) + CHR(39)
//      + ' AND TB_ESTOQUE.COD_FILIAL = 2 ORDER BY TB_ESTOQUE.COD_FILIAL')));

      ShowMessage('Filial: 01 - Quantidade: ' + DMOracle.BuscaNome('SELECT TB_ESTOQUE.QT_QUANTIDADE FROM TB_PRODUTO, TB_ESTOQUE ', ' TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      + ' AND TB_ESTOQUE.COD_LOTE_TIPO = 1 AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_item2NUM_FABRICANTE.Value) + CHR(39)
      + ' AND TB_ESTOQUE.COD_FILIAL = 1') + CHR(13) + 'Data Última Compra: '
      + (DMOracle.BuscaNome('SELECT TB_ESTOQUE.DT_COMPRA FROM TB_PRODUTO, TB_ESTOQUE', ' TB_ESTOQUE.COD_PRODUTO = TB_PRODUTO.COD_PRODUTO'
      + ' AND TB_ESTOQUE.COD_LOTE_TIPO = 1 AND TB_ESTOQUE.COD_FILIAL = 1'
      + ' AND TB_PRODUTO.NUM_FABRICANTE = ' + CHR(39) + (DMOficina.QRequisicao_item2NUM_FABRICANTE.Value) + CHR(39))));
  end;
end;

procedure TFRequisicaoCad2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  with DMOficina do
  begin
    if QRequisicao_item2.State in [DSInsert, DSEdit] then
    begin
      MessageDlg('Existem itens não confirmados na requisição. ' +
      #13+#10 +
      'Confirme antes de sair.', mtWarning, [mbOk], 0);
      Abort;
    end;
  end;
end;

procedure TFRequisicaoCad2.OracleNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  //if Button <> OracleNavigator.nbInsert then
  //if Button = OracleNavigator.nbDelete then
  //  SBRefreshClick(Sender);
  //Setar o Foco no campo NUM_FABRICANTE. Junior 06/11/2013.
   DBPanel7.CanFocus
end;

procedure TFRequisicaoCad2.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FOFI0016 = Nil then
    FOFI0016 := TFOFI0016.Create(Application);
  if FOFI0016.ShowModal = MrOk then
  begin
    MELocaliza.Text := DMOficina.QRequisicaoCad2NUM_REQUISICAO.Text;
    MELocalizaExit(self);
  end;
end;

procedure TFRequisicaoCad2.SBMarcacaoCadClick(Sender: TObject);
begin
  inherited;
  if FOFI0010 = nil then
    FOFI0010 := TFOFI0010.Create(Application);
  FOFI0010.ShowModal;
end;

procedure TFRequisicaoCad2.SBFinalizaMarcacaoClick(Sender: TObject);
begin
  inherited;
  if FMarcacaoFinalizar = nil then
    FMarcacaoFinalizar := TFMarcacaoFinalizar.Create(Application);
  FMarcacaoFinalizar.ShowModal;
end;

procedure TFRequisicaoCad2.FormActivate(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin 
    QRequisicaoCad2.Open;
    QRequisicao_item2.Open;
  end;
end;

procedure TFRequisicaoCad2.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  with DMOficina do
  begin
    QRequisicaoCad2.Close;
    QRequisicaoCad2.SetVariable('PK',0);
    QRequisicaoCad2.Open;
  end;
end;

procedure TFRequisicaoCad2.SBBloquearClick(Sender: TObject);
var wLiberado : String;
begin
  inherited;
  //Bloquear a Requisição. Funcionários estavam adicionando itens sem estar de acordo com a solicitação do cliente.
  //assim a Raquel pode ter um controle maior. Solicitação RAQUEL - MEDIBENS. Junior - 07/07/2015
  if Trim(DMOficina.QRequisicaoCad2NUM_REQUISICAO.Text) <> '' then
  begin
    if (DMOracle.FastSelect('IND_LIBERADO','TB_REQUISICAO','NUM_REQUISICAO = ' + DMOficina.QRequisicaoCad2NUM_REQUISICAO.Text) = 'S') then
    Begin
      DMOracle.ExecutaSql('UPDATE TB_REQUISICAO SET IND_LIBERADO = ' + QuotedStr('N') + 'WHERE NUM_REQUISICAO = ' +
         DMOficina.QRequisicaoCad2NUM_REQUISICAO.Text, True);
      ShowMessage('Requisição Bloqueada');
    End
    Else
      ShowMessage('Requisição já está bloqueada');
  End
  Else
    Raise Exception.Create('Selecione a Requisição');
end;

procedure TFRequisicaoCad2.SBDesbloquearClick(Sender: TObject);
begin
  inherited;
  if FSenha = nil then
    FSenha := TFSenha.Create(Application);
    if FSenha.ShowModal = MrOk then
    begin
      if UpperCase(Trim(FSenha.EdSenha.Text)) = UpperCase(DmParamSistema.QParamSistemaDesc_Senha_Oficina.Value) then
      begin
      DMOracle.ExecutaSql('UPDATE TB_REQUISICAO SET IND_LIBERADO = ' + QuotedStr('S') + 'WHERE NUM_REQUISICAO = ' +
         DMOficina.QRequisicaoCad2NUM_REQUISICAO.Text, True);
      ShowMessage('Requisição Liberada');
      end
      Else
        raise Exception.Create('Senha Inválida');
    end
    else
      Abort;
end;

end.
