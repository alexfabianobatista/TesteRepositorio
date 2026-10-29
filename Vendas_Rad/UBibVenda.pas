unit UBibVenda;

interface

uses Forms, Controls, Dialogs, SysUtils, Math, OraTeste, Messages, Windows;

  type TBibVenda = Class

  private
    wNotaAutomatica: boolean;
    function PersonalizaBCPisCofinsDebona(
    wValTotal, wValIpi, wValIcmsSubst, wBasePisCofins
      , wAliqPisCofins: double): double;
    function PersonalizaDadosDeion(wItemNF: TOracleDataSet1
      ; wFilial: integer): TOracleDataSet1;

  public
    constructor Create; overload;
    function ImprimeObs(wCodEmpresa : String) : String;
    function ImprimeDataHora(wCodEmpresa: String) : String;
    function ImprimeVendedor(wCodEmpresa: String) : String;

    function PersonalizaMapaVenda(wCodEmpresa : String;
      pMapaVenda : TForm) : TForm;
    function PersonalizaMapaVendaRes(wCodEmpresa : String;
      pMapaVendaRes : TForm) : TForm;
    function MapaVendaPollyana(pMapaVenda : TForm)
      : TForm;
    function MapaVendaResPollyana(pMapaVendaRes : TForm)
      : TForm;
    procedure PersonalizaNotaSaidaParam(wCodEmpresa : String; pNotaSaidaParam: TForm);
    procedure PersonalizaNota(wCod_empresa : String; pNotaSaidaCad: TForm);
    procedure PersonalizaNotaDiniz(pNotaSaidaCad: TForm);
    procedure PersonalizaNotaZito(pNotaSaidaCad: TForm);

    function PersonalizaPreco(wCodEmpresa: String; wPreco: double;
      wCodProduto: string): double;
    function PersonalizaPrecoBarraus(wCodProduto: string): double;
    function PersonalizaBCPisCofins(wCodEmpresa: string
      ; wValTotal, wValIpi, wValIcmsSubst, wBasePisCofins
      , wAliqPisCofins, wValorCalculado: double): double;
    function PersonalizaDados(wItemNF: TOracleDataSet1
      ; wFilial: integer): TOracleDataSet1;
    function LiberaBloqueioTabelaPreco: Boolean;
    //procedure SetProp(var pForm: TForm; pComponentName: String; pPropertyName: String; pValue: Variant);
    property pNotaAutomatica: boolean Read wNotaAutomatica write wNotaAutomatica;
  end;

var BibVenda : TBibVenda;

implementation

uses UOracle_cl, UNotaSaida_cl, TypInfo, UParamSistema_cl, UUsuario_cl, USenha,
  UBiblioteca;


{ TBibVenda }


//Adiciona novos dados na impressão do pedido
function TBibVenda.ImprimeObs(wCodEmpresa: String) : String;
begin
//  if wCodEmpresa = 'SRTERRA' then
//  begin
//   result := ' ' + Dmnotasaida.QNotaSaidaCOD_OBRA.Text +' '+
//    DmOracle.FastSelect('DESC_OBRA', 'TB_OBRA','COD_OBRA = '
//    + Dmnotasaida.QNotaSaidaCOD_OBRA.Text);
//  end
//  else
  result := '';
end;

//Imprime Data e Hora
function TBibVenda.ImprimeDataHora(wCodEmpresa: String) : String;
begin
//  if wCodEmpresa = 'NUTRIVET' then
//    result := Dmnotasaida.QNFE_EmiteDT_USUARIO.Text
//  else
    result := DMNotaSaida.QNFE_EmiteDT_EMISSAO.Text;
end;

//Imprime Código ou Nome do Vendedor
function TBibVenda.ImprimeVendedor(wCodEmpresa: String) : String;
begin
  if wCodEmpresa = 'NUTRIVET' then
    result := Dmnotasaida.QNFE_EmiteCOD_VENDEDOR.Text
  else
    result := DMNotaSaida.QNFE_EmiteNOME_VENDEDOR.Text;
end;

function TBibVenda.MapaVendaPollyana(
  pMapaVenda: TForm): TForm;
begin
  //Peso bruto sobrepõe a coluna Lucro. - Vanessa 27/07/2015
  SetPropValue(pMapaVenda.FindComponent('QRLLucro'),'Caption','P.Bruto');
  SetPropValue(pMapaVenda.FindComponent('QRExprLucro'),'Expression','QRMapaVenda.SPESO_BRUTO');
  SetPropValue(pMapaVenda.FindComponent('QRExprSumLucro'),'Expression','SUM(QRMapaVenda.SPESO_BRUTO)');
  //pMapaVenda.QRLLucro.Caption := 'P.Bruto';
//  pMapaVenda.QRExprLucro.Expression := 'QRMapaVenda.SPESO_BRUTO';
//  pMapaVenda.QRExprSumLucro.Expression := 'SUM(QRMapaVenda.SPESO_BRUTO)';
  result := pMaPaVenda;
end;

function TBibVenda.MapaVendaResPollyana(
  pMapaVendaRes: TForm): TForm;
begin
  //Peso Bruto sobrepõe a coluna Lucro. Vanessa 27/07/2015
  SetPropValue(pMapaVendaRes.FindComponent('QRLLucro'),'Caption','P.Bruto');
  SetPropValue(pMapaVendaRes.FindComponent('QRExprLucro'),'Expression','QRMapaVendaRes.SPESO_BRUTO');
  SetPropValue(pMapaVendaRes.FindComponent('QRExprSumLucro'),'Expression','SUM(QRMapaVendaRes.SPESO_BRUTO)');
 // pMapaVendaRes.QRLLucro.Caption := 'P.Bruto';
//  pMapaVendaRes.QRExprLucro.Expression := 'QRMapaVendaRes.SPESO_BRUTO';
//  pMapaVendaRes.QRExprSumLucro.Expression := 'SUM(QRMapaVendaRes.SPESO_BRUTO)';
  result := pMapaVendaRes;
end;

//Funcão criada para alterar o mapa de vendas por empresa - Vanessa 27/07/2015
function TBibVenda.PersonalizaMapaVenda(wCodEmpresa: String;
  pMapaVenda : TForm) : TForm;
begin
  result := pMapaVenda;
  if wCodEmpresa = 'POLLYANA' then
    result := MapaVendaPollyana(pMapaVenda);
end;

//Funcão criada para alterar o mapa de vendas resumido por empresa - Vanessa 27/07/2015
function TBibVenda.PersonalizaMapaVendaRes(wCodEmpresa: String;
  pMapaVendaRes: TForm): TForm;
begin
  result := pMapaVendaRes;
  if wCodEmpresa = 'POLLYANA' then
    result := MapaVendaResPollyana(pMapaVendaRes);
end;

procedure TBibVenda.PersonalizaNota(wCod_empresa: String; pNotaSaidaCad: TForm);
begin
  if wCod_empresa = 'DINIZ' then
    PersonalizaNotaDiniz(pNotaSaidaCad); //Diniz quer que todas as notas se iniciem a prazo. Vanessa 21/08/2015

  if wCod_empresa = 'ZITO' then
    PersonalizaNotaZito(pNotaSaidaCad);
end;

procedure TBibVenda.PersonalizaNotaDiniz(pNotaSaidaCad: TForm);
begin
  if GetPropValue(pNotaSaidaCad.FindComponent('DBRadioGroup2'),'Visible') then
    DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
end;

procedure TBibVenda.PersonalizaNotaSaidaParam(wCodEmpresa: String; pNotaSaidaParam: TForm);
begin
  if wCodEmpresa = 'POLLYANA' then
    SetPropValue(pNotaSaidaParam.FindComponent('CBCusto2'),'Caption','Exibir Custo e Peso Bruto');
   // FNotaSaidaParam.CBCusto2.Caption := 'Exibir Custo e Peso Bruto'; //Para a Pollyana não tem coluna Lucro, porque mudei para Peso Bruto. Vanessa 27/07/2015
end;


function TBibVenda.PersonalizaPreco(wCodEmpresa: String;
  wPreco: double; wCodProduto: string): double;
begin
  result := wPreco;
  if wCodEmpresa = 'BARRAUS' then
    result := PersonalizaPrecoBarraus(wCodProduto);
end;

function TBibVenda.PersonalizaPrecoBarraus(wCodProduto: string): double;
begin
  with DMNotaSaida do
  begin
    if ((QNotaSaidaIND_CONDICAO_PAGTO.Value = '1') or (QNotaSaidaIND_CONDICAO_PAGTO.Value = '5')) then
      result := strToFloat(DMOracle.FastSelect(
        'NVL(VAL_VAREJO,0)', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto
      ))
    else
      result := strToFloat(DMOracle.FastSelect(
        'NVL(VAL_ATACADO,0)', 'TB_PRODUTO', 'COD_PRODUTO = ' + wCodProduto
      ));
  end;
end;

procedure TBibVenda.PersonalizaNotaZito(pNotaSaidaCad: TForm);
begin
  if GetPropValue(pNotaSaidaCad.FindComponent('DBRadioGroup2'),'Visible') then
  begin
    if DMNotaSaida.QNotaSaidaCOD_CADASTRO.Value = 1775 then  //Consumidor sempre puxar à vista.
      DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '1'
    else
      DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value := '2';
  end;
end;

function TBibVenda.PersonalizaBCPisCofins(wCodEmpresa: string
  ; wValTotal, wValIpi, wValIcmsSubst, wBasePisCofins
  , wAliqPisCofins, wValorCalculado: double): double;
begin
  result := wValorCalculado;
  if wCodEmpresa = 'DEBONA' then
    PersonalizaBCPisCofinsDebona(
      wValTotal, wValIpi, wValIcmsSubst, wBasePisCofins
      , wAliqPisCofins);
end;

function TBibVenda.PersonalizaBCPisCofinsDebona(
  wValTotal, wValIpi, wValIcmsSubst, wBasePisCofins
  , wAliqPisCofins: double): double;
begin
  result := RoundTo(
              ((wValTotal - wValIpi - wValIcmsSubst) *
              wBasePisCofins / 100) *
              wAliqPisCofins / 100,-2);
end;

function TBibVenda.PersonalizaDados(
  wItemNF: TOracleDataSet1; wFilial: integer): TOracleDataSet1;
begin
  result := wItemnf;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DEION' then
    result := PersonalizaDadosDeion(wItemNF, wFilial);
end;

function TBibVenda.PersonalizaDadosDeion(
  wItemNF: TOracleDataSet1; wFilial: integer): TOracleDataSet1;
  var wDescProduto: string;
    wTipoConsumidor: string;
begin
  result := wItemNF;

  if wItemNF.Name = 'QItemNF' then
    wTipoConsumidor
      := DMOracle.FastSelect('NVL(IND_CONSUMIDOR_FINAL,' + QuotedStr('N') + ')'
        , 'TB_NOTA_CAB', 'COD_NOTA_CAB = ' + intToStr(wItemNF.FieldValues['COD_NOTA_CAB']))
  else
    wTipoConsumidor
      := DMOracle.FastSelect('NVL(IND_CONSUMIDOR_FINAL,' + QuotedStr('N') + ')'
        , 'TB_PEDIDO_CAB', 'COD_PEDIDO_CAB = ' + intToStr(wItemNF.FieldValues['COD_PEDIDO_CAB']));

  // Configurações feitas para quando a filial 1 era do regime normal
  // e filial 2 era do simples
  {
  if (wTipoConsumidor = 'S') and (wFilial = 2) then
  begin
    wItemNF.FieldValues['COD_CFOP'] := 5101;
    wItemNF.FieldValues['COD_TRIBUTACAO'] := 10;
    result := wItemNF;
  end;

  if (wTipoConsumidor = 'S') and (wFilial = 1) then
  begin
    wItemNF.FieldValues['COD_CFOP'] := 5101;
    wItemNF.FieldValues['COD_TRIBUTACAO'] := 19;
    result := wItemNF;
  end;
  }

  // Configuração feita para as 2 filiais no regime simples
  // Caso a filial 1 volte para o regime normal, basta apagar o código abaixo
  // e descomentar o código acima
  if (wTipoConsumidor = 'S') then
  begin
    wItemNF.FieldValues['COD_CFOP'] := 5101;
    wItemNF.FieldValues['COD_TRIBUTACAO'] := 10;
    result := wItemNF;
  end;

  // Comentado o if pois as 2 filiais pertencem ao simples
  //if wFilial = 2 then
  //begin
    wDescProduto :=
      DMOracle.FastSelect('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO = '
        + FloatToStr(wItemNF.FieldValues['COD_PRODUTO']));
    if (Pos('INTERCAP', wDescProduto) > 0) or
       ((Pos('SABONETE', wDescProduto) > 0) and (wFilial = 2)) then
    begin
      wItemNF.FieldValues['COD_CFOP'] := 5405;
      wItemNF.FieldValues['COD_TRIBUTACAO'] := 9;
    end;
    result := wItemNF;
  //end;

end;

function TBibVenda.LiberaBloqueioTabelaPreco: Boolean;
var FSenha: TFSenha;
  wDescTipoFuncionario, wsenhaCrypt: string;
begin

  Result := true;

//  with DMParamSistema, DMUsuario do
//  begin
//    if (QParamSistemaIND_BLOQUEIO_TABELA_PRECO.Value = 'LIBERADO') then
//      Exit;
//
//    if QParamSistemaIND_BLOQUEIO_TABELA_PRECO.Value = 'BLOQUEADO' then
//    begin
//      Result := Privilegiado;
//      Exit;
//    end;
//
//    if (QParamSistemaIND_BLOQUEIO_TABELA_PRECO.Value = 'SENHA') then // Senha - Deve pedir senha ao alterar a lista
//    begin
//      FSenha := TFSenha.Create(Application);
//      if (FSenha.ShowModal = MrOK) and (Trim(FSenha.MeUsuario.Text) <> '') then
//      begin
//        DMUsuario.QUsuario.Close;
//        DMUsuario.QUsuario.SetVariable('PK',StrToInt(Trim(FSenha.MeUsuario.Text)));
//        DMUsuario.QUsuario.Open;
//        wDescTipoFuncionario := DMUsuario.QUsuarioDESC_TIPO_FUNCIONARIO.Text;
//        if (wDescTipoFuncionario = 'DIRETOR') or (wDescTipoFuncionario = 'GERENTE') or
//           (wDescTipoFuncionario = 'SUPERVISOR') or
//           (DMUsuario.QUsuarioIND_PRIVILEGIO.Value = 'P') then
//        begin
//          wsenhaCrypt := bib.Decode(DMUsuario.QUsuarioDesc_Senha.Value);
//          If (UpperCase(Trim(FSenha.EdSenha.Text)) <> Trim(wsenhaCrypt))then
//          begin
//            Result := false;
//            MessageDlg('Informe a senha de liberação correta.', mtError,
//              [mbOk], 0);
//          end;
//        end
//        else
//        begin
//          Result := false;
//          MessageDlg('Usuário sem permissão para alterar tabela de preço.', mtError,
//            [mbOk], 0);
//        end;
//      end
//      else
//      begin
//        Result := false;
//        MessageDlg('Usuário não informado', mtError,
//          [mbOk], 0);
//      end;
//    end;
//  end;
end;

constructor TBibVenda.Create;
begin
  pNotaAutomatica := false;
end;

end.


