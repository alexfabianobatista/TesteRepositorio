unit UUsuario_cl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, OracleData, OraTeste, UBiblioteca;

type
  IMensagemUsuario = interface
    function Query: TOracleDataset1;
  end;

  TDMUsuario = class(TDataModule, IPortaUsuarioListener)
    DSUsuario: TDataSource;
    DSUsuarioAll: TDataSource;
    QUsuario: TOracleDataSet1;
    QUsuarioCons: TOracleDataSet1;
    QUsuarioConsCOD_USUARIO: TIntegerField;
    QUsuarioConsNOME: TStringField;
    QUsuarioAll: TOracleDataSet1;
    QUsuarioAllCOD_USUARIO: TIntegerField;
    QUsuarioAllNOME: TStringField;
    QUsuarioFilial: TOracleDataSet1;
    QUsuarioFilialCOD_USUARIO_FILIAL: TIntegerField;
    QUsuarioFilialCOD_MODULO: TIntegerField;
    QUsuarioFilialCOD_USUARIO: TIntegerField;
    QUsuarioFilialCOD_FILIAL: TIntegerField;
    QUsuarioFilialCons: TOracleDataSet;
    QUsuarioFilialConsCOD_USUARIO_FILIAL: TIntegerField;
    QUsuarioFilialConsDESC_FILIAL: TStringField;
    QUsuarioFilialConsNOME_MODULO: TStringField;
    QUsuarioFilialConsNOME: TStringField;
    QUsuarioPorta: TOracleDataSet1;
    QUsuarioPortaCOD_USUARIO: TIntegerField;
    QUsuarioPortaDESC_PORTA: TStringField;
    QUsuarioPortaDESC_CAMINHO: TStringField;
    QUsuarioPortaDESC_USUARIO: TStringField;
    QUsuarioPortaDESC_SENHA: TStringField;
    QUsuarioCOD_USUARIO: TIntegerField;
    QUsuarioDESC_SENHA: TStringField;
    QUsuarioDT_ULTIMA_ALTERACAO: TDateTimeField;
    QUsuarioNUM_DIAS_ALTERACAO: TIntegerField;
    QUsuarioIND_PRIVILEGIO: TStringField;
    QUsuarioCOD_DEPARTAMENTO: TIntegerField;
    QUsuarioCOD_FILIAL: TIntegerField;
    QUsuarioNOME: TStringField;
    QUsuarioCOD_SERIE_PADRAO: TStringField;
    QUsuarioCOD_CLIENTE_PADRAO: TIntegerField;
    QUsuarioCOD_OPERACAO_PADRAO: TIntegerField;
    QUsuarioCOD_VENDEDOR_PADRAO: TIntegerField;
    QUsuarioCOD_SERIE_PRAZO: TStringField;
    QUsuarioCOD_SERIE_CC: TStringField;
    QUsuarioCOD_SERIE_CARTAO: TStringField;
    QUsuarioIND_CONTABIL_PRIVILEGIO: TStringField;
    QUsuarioDESC_TIPO_FUNCIONARIO: TStringField;
    QUsuarioPERC_DESCONTO_MAXIMO: TFloatField;
    QUsuarioCOD_PARCERIA: TIntegerField;
    QUsuarioDESC_IMPRESSORA_DANFE: TStringField;
    QUsuarioCOD_FINALIDADE: TIntegerField;
    QUsuarioDESC_LOGIN_LFAX: TStringField;
    QUsuarioDESC_SENHA_LFAX: TStringField;
    QUsuarioConsDESC_IMPRESSORA_DANFE: TStringField;
    QUsuarioConsDESC_TIPO_FUNCIONARIO: TStringField;
    QUsuarioConsIND_PRIVILEGIO: TStringField;
    QUsuarioConsFILIAL: TStringField;
    QUsuarioConsPERC_DESCONTO_MAXIMO: TFloatField;
    QUsuarioConsdesc_privilegio: TStringField;
    QUsuarioCOD_SERIE_MODELO_PADRAO: TStringField;
    QUsuarioCOD_SERIE_MODELO_PRAZO: TStringField;
    QSerieModeloCons: TOracleDataSet1;
    QSerieModeloConsORDEM: TFloatField;
    QSerieModeloConsCOD_SERIE_MODELO: TStringField;
    QSerieModeloConsDESC_SERIE_MODELO: TStringField;
    QSerieModeloConsDESC_COMPLETA: TStringField;
    DSSerieModeloCons: TDataSource;
    QSerieModeloPrazoCons: TOracleDataSet1;
    DSSerieModeloPrazoCons: TDataSource;
    QSerieModeloPrazoConsORDEM: TFloatField;
    QSerieModeloPrazoConsCOD_SERIE_MODELO: TStringField;
    QSerieModeloPrazoConsDESC_SERIE_MODELO: TStringField;
    QSerieModeloPrazoConsDESC_COMPLETA: TStringField;
    QUsuarioDESC_IMPRESSORA_DACTE: TStringField;
    QUsuarioCOD_SERIE_CTE: TStringField;
    QUsuarioCOD_SERIE_MODELO_CTE: TStringField;
    QUsuarioCOD_OPERACAO_CTE: TIntegerField;
    QUsuarioCOD_TRIBUTACAO_PADRAO_CTE: TIntegerField;
    QUsuarioDESC_IMPRESSORA_DANFE_NFCE: TStringField;
    QUsuarioCOD_FINALIDADE_PAGAR: TIntegerField;
    QUsuarioDESC_IMPRESSORA_VALE_PRODUTO: TStringField;
    QUsuarioFilialConsCOD_FILIAL: TIntegerField;
    QUsuarioDESC_IMPRESSORA_ZEBRA_EPL: TStringField;
    QUsuarioDESC_EMAIL: TStringField;
    QUsuarioDESC_SMTP: TStringField;
    QUsuarioNUM_PORTA_SMTP: TIntegerField;
    QUsuarioIND_SSL: TStringField;
    QUsuarioDESC_SENHA_EMAIL: TStringField;
    QUsuarioNUM_CPF_USUARIO: TStringField;
    QUsuarioCOD_USUARIO_CORRENTE: TIntegerField;
    QUsuarioCOD_ENTREGADOR_PADRAO: TIntegerField;
    QUsuarioConsCOD_ENTREGADOR_PADRAO: TIntegerField;
    QDispositivos: TOracleDataSet1;
    QDispositivosCOD_DISPOSITIVO: TStringField;
    QDispositivosDESC_DISPOSITIVO: TStringField;
    QDispositivosDESC_MODELO: TStringField;
    QDispositivosCOD_FILIAL: TFloatField;
    QDispositivosCOD_USUARIO: TFloatField;
    QDispositivosDT_ULTIMO_ACESSO: TDateTimeField;
    QDispositivosDT_REGISTRO: TDateTimeField;
    QDispositivosIND_SITUACAO: TStringField;
    QDispositivosDESC_IP_ULTIMO_ACESSO: TStringField;
    QDispositivosdescfilial: TStringField;
    QDispositivosCons: TOracleDataSet1;
    QDispositivosConsCOD_DISPOSITIVO: TStringField;
    QDispositivosConsDESC_DISPOSITIVO: TStringField;
    QDispositivosConsDESC_MODELO: TStringField;
    QDispositivosConsCOD_FILIAL: TFloatField;
    QDispositivosConsCOD_USUARIO: TFloatField;
    QDispositivosConsDT_ULTIMO_ACESSO: TDateTimeField;
    QDispositivosConsDT_REGISTRO: TDateTimeField;
    QDispositivosConsIND_SITUACAO: TStringField;
    QDispositivosConsDESC_IP_ULTIMO_ACESSO: TStringField;
    QDispositivosConsdescfilial: TStringField;
    QDispositivosConsnomeusuario: TStringField;
    QDispositivosnomeusuario: TStringField;
    QRDispovitosDtAcesso: TOracleDataSet1;
    QRDispovitosDtAcessoCOD_DISPOSITIVO: TStringField;
    QRDispovitosDtAcessoDESC_DISPOSITIVO: TStringField;
    QRDispovitosDtAcessoDESC_MODELO: TStringField;
    QRDispovitosDtAcessoCOD_FILIAL: TFloatField;
    QRDispovitosDtAcessoDESC_FILIAL: TStringField;
    QRDispovitosDtAcessoCOD_USUARIO: TFloatField;
    QRDispovitosDtAcessoNOME: TStringField;
    QRDispovitosDtAcessoDT_ACESSO: TDateTimeField;
    QRDispovitosDtAcessoDESC_IP: TStringField;
    QRDispovitosDtAcessoIND_AUTORIZADO: TStringField;
    procedure QUsuarioAfterInsert(DataSet: TDataSet);
    procedure QUsuarioAfterEdit(DataSet: TDataSet);
    procedure QUsuarioFilialAfterPost(DataSet: TDataSet);
    procedure QUsuarioFilialAfterDelete(DataSet: TDataSet);
    procedure QUsuarioFilialAfterRefreshRecord(Sender: TOracleDataSet);
    procedure QUsuarioFilialAfterInsert(DataSet: TDataSet);
    procedure QUsuarioAfterOpen(DataSet: TDataSet);
    procedure QUsuarioBeforeClose(DataSet: TDataSet);
    procedure QUsuarioPortaAfterInsert(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure QUsuarioPortaBeforeInsert(DataSet: TDataSet);
    procedure QUsuarioBeforeDelete(DataSet: TDataSet);
    procedure QUsuarioPortaBeforeDelete(DataSet: TDataSet);
    procedure QUsuarioConsCalcFields(DataSet: TDataSet);
    procedure QUsuarioBeforePost(DataSet: TDataSet);
    procedure QDispositivosCalcFields(DataSet: TDataSet);
    procedure QDispositivosConsCalcFields(DataSet: TDataSet);
    procedure QDispositivosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    wCodUsuario,wCodModulo : Integer;
    FCodUsuarioCorrente : Integer;
    FCodFilialUsuario : Integer;
    FCodDepartamentoUsuario : Integer;
    FCodFinalidadeUsuario : Integer;
    FCodFinalidadePagarUsuario : Integer;
    FPrivilegiado : Boolean;
    FContabilPrivilegiado : Boolean;
    fCodClientePadrao : Integer;
    fCodVendedorPadrao : Integer;
    fPerc_Desconto_Maximo : Real;
    fCodOperacaoPadrao : Integer;
    fCodOperacaoCTe : Integer;
    fCodTributacaoCTe: Integer;
    fCodSeriePadrao : String;
    fCodSerieCTe : String;
    fCodSeriePrazo : String;
    fCodSerieCC : String;
    fCodSerieCartao : String;
    fCodParceria : String;
    fTipoFuncionario : String;
    fCodSerieModeloPadrao: String;
    fCodSerieModeloCTe: String;
    fCodSerieModeloPrazo: String;
    fImpressoraPadraoNFCe: String;
    fImpressoraPadraoNFe: String;
    fImpressoraPadraoValeProduto: String;
    fDispositivoBloqueado: String;
    FMensagemUsuario: IMensagemUsuario;
    procedure ProcessaMensagens;
  public
    { Public declarations }
    Procedure ValidaSenha(pCodUsuario:Real; pSenha : String);
    Property CodUsuarioCorrente : Integer Read FCodUsuarioCorrente Write FCodUsuarioCorrente;
    Property Privilegiado : Boolean  Read FPrivilegiado Write FPrivilegiado;
    Property ContabilPrivilegiado : Boolean  Read FContabilPrivilegiado Write FContabilPrivilegiado;
    Property CodFilialUsuario : Integer Read FCodFilialUsuario Write FCodFilialUsuario;
    Property CodDepartamentoUsuario : Integer Read FCodDepartamentoUsuario Write FCodDepartamentoUsuario;
    Property CodFinalidadeUsuario : Integer Read FCodFinalidadeUsuario Write FCodFinalidadeUsuario;
    Property CodFinalidadePagarUsuario : Integer Read FCodFinalidadePagarUsuario Write FCodFinalidadePagarUsuario;
    Procedure TrocaSenha(wCod_Usuario : Integer;wDesc_Senha_Antiga,wDesc_Senha:String);
    Function VerificaMapeamento(Porta: String): Boolean;
    Function BuscaUsuRede : Real;
    Property CodClientePadrao : Integer Read fCodClientePadrao Write fCodClientePadrao;
    Property CodVendedorPadrao : Integer Read fCodVendedorPadrao Write fCodVendedorPadrao;
    Property CodOperacaoPadrao : Integer Read fCodOperacaoPadrao Write fCodOperacaoPadrao;
    Property CodOperacaoCTe : Integer Read fCodOperacaoCTe Write fCodOperacaoCTe;
    Property CodTributacaoCTe: Integer Read fCodTributacaoCTe write fCodTributacaoCTe;
    Property pPerc_Desconto_Maximo : Real Read fPerc_Desconto_Maximo Write fPerc_Desconto_Maximo;
    Property CodSeriePadrao : String Read fCodSeriePadrao Write fCodSeriePadrao;
    Property CodSerieCTe : String Read fCodSerieCTe Write fCodSerieCTe;
    Property CodSeriePrazo : String Read fCodSeriePrazo Write fCodSeriePrazo;
    Property CodSerieCC : String Read fCodSerieCC Write fCodSerieCC;
    Property CodSerieCartao : String Read fCodSerieCartao Write fCodSerieCartao;
    Property pTipoFuncionario : String Read fTipoFuncionario Write fTipoFuncionario;
    Procedure Checar_Filial_Usuario(Cod_Filial,Modulo:String);
    Property pCodParceria : String Read fCodParceria Write fCodParceria;
    Property MensagemUsuario: IMensagemUsuario read FMensagemUsuario write FMensagemUsuario;
    Property CodSerieModeloPadrao : String Read fCodSerieModeloPadrao Write fCodSerieModeloPadrao;
    Property CodSerieModeloCTe : String Read fCodSerieModeloCTe Write fCodSerieModeloCTe;
    Property CodSerieModeloPrazo : String Read fCodSerieModeloPrazo Write fCodSerieModeloPrazo;
    property ImpressoraPadraoNFCe: String Read fImpressoraPadraoNFCe write fImpressoraPadraoNFCe;
    property ImpressoraPadraoNFe: String Read fImpressoraPadraoNFe write fImpressoraPadraoNFe;
    property ImpressoraPadraoValeProduto: String Read fImpressoraPadraoValeProduto write fImpressoraPadraoValeProduto;
    property DispositivoBloqueado: String Read fDispositivoBloqueado write fDispositivoBloqueado;
  end;

var
  DMUsuario: TDMUsuario;
  
implementation

uses UOracle_cl;

{$R *.DFM}

procedure TDMUsuario.QUsuarioAfterInsert(DataSet: TDataSet);
begin
  QUsuarioCod_Usuario.Value := DMOracle.Sequencia('USUARIO');
  QUsuarioDt_Ultima_Alteracao.Value := DMOracle.DataServ;
  QUsuarioInd_Privilegio.Value := 'N';
end;

Procedure TDMUsuario.ValidaSenha(pCodUsuario:Real; pSenha : String);
Var wSenhaNova,wSenhaNovaCrip : String;
Const wBranco : String = '               ';
Begin
  // Validar a Senha do Usuario;
  wSenhaNova := Trim(pSenha)+Copy(wBranco,1,10-Length(pSenha));
  wSenhaNovaCrip := Bib.Encode(wSenhaNova);
  QUsuario.Close;
  QUsuario.SetVariable('PK',pCodUsuario);
  // QUsuario.ParamByName('SENHA').AsString := Trim(UpperCase(pSenha));
  QUsuario.Open;
  If QUsuarioIND_PRIVILEGIO.Value = 'I' Then
     Raise Exception.Create('Usuário Inativo');
  If ( Trim(QUsuarioDesc_Senha.Value) = Trim(UpperCase(pSenha)) )
     or (QUsuarioDesc_Senha.Value = wSenhaNovaCrip )then
  Begin
//    If (QUsuarioDt_Ultima_Alteracao.Value+QUsuarioNum_Dias_Alteracao.Value) < DMOracle.DataServ then
//      Raise Exception.Create('Senha expirada!');
    CodUsuarioCorrente := QUsuarioCod_Usuario.Value;
    CodFilialUsuario := QUsuarioCod_Filial.Value;
    CodDepartamentoUsuario := QUsuarioCod_Departamento.Value;
    CodFinalidadeUsuario := QUsuarioCOD_FINALIDADE.Value;
    CodFinalidadePagarUsuario := QUsuarioCOD_FINALIDADE_PAGAR.Value;
    Privilegiado := QUsuarioInd_Privilegio.Value = 'P';
    ContabilPrivilegiado := QUsuarioInd_Contabil_Privilegio.Value = 'SIM';
    CodClientePadrao :=  QUsuarioCOD_CLIENTE_PADRAO.Value;
    CodVendedorPadrao := QUsuarioCOD_VENDEDOR_PADRAO.Value;
    CodOperacaoPadrao := QUsuarioCOD_OPERACAO_PADRAO.Value;
    CodOperacaoCTe := QUsuarioCOD_OPERACAO_CTE.Value;
    CodTributacaoCTe := QUsuarioCOD_TRIBUTACAO_PADRAO_CTE.Value;
    CodSeriePadrao := QUsuarioCod_Serie_Padrao.Value;
    CodSerieCTe := QUsuarioCOD_SERIE_CTE.Value;
    CodSeriePrazo := QUsuarioCod_Serie_Prazo.Value;
    CodSerieModeloPadrao := QUsuarioCOD_SERIE_MODELO_PADRAO.Value;
    CodSerieModeloCTe := QUsuarioCOD_SERIE_MODELO_CTE.Value;
    CodSerieModeloPrazo := QUsuarioCOD_SERIE_MODELO_PRAZO.Value;
    CodSerieCC := QUsuarioCod_Serie_CC.Value;
    CodSerieCartao := QUsuarioCod_Serie_Cartao.Value;
    fImpressoraPadraoNFCe := QUsuarioDESC_IMPRESSORA_DANFE_NFCE.Value;
    fImpressoraPadraoNFe := QUsuarioDESC_IMPRESSORA_DANFE.Value;
    fImpressoraPadraoValeProduto := QUsuarioDESC_IMPRESSORA_VALE_PRODUTO.Value;
    pTipoFuncionario := QUsuarioDesc_Tipo_Funcionario.Value;
    pCodParceria := QUsuarioCod_Parceria.Text;
    If QUsuarioPerc_Desconto_Maximo.Text = '' Then
       pPerc_Desconto_Maximo := 0
    Else
       pPerc_Desconto_Maximo := QUsuarioPerc_Desconto_Maximo.Value;

    ProcessaMensagens;
  end
  else
  begin
    //raise Exception.Create('Senha inválida!');
    MessageDlg('Senha inválida!', mtError, [mbOK], 0);
    Abort;
  end;
  //QUsuario.Close;
end;

procedure TDMUsuario.ProcessaMensagens;
var
  Qu: TOracleDataset1;
begin
  try
    if FMensagemUsuario = nil then
      Exit;
    Qu := FMensagemUsuario.Query;
    Qu.Close;
    Qu.SetVariable('COD_USUARIO_DESTINO', DMUsuario.CodUsuarioCorrente);
    Qu.SetVariable('DT_ATUAL', Date);
    Qu.Open;

    Qu.First;

    while not Qu.Eof do
    begin
      if MessageDlg('Mensagem recebida de ' + Qu.FieldByName('NOME_USUARIO_ORIGEM').Value + ': ' + #13 + #10 +
          Qu.FieldByName('DESC_MENSAGEM').Text + #13 + #10 + #13 + #10 +
          'Marcar como lida?', mtInformation, [mbYes, mbNo], 0) = mrYes
      then
        DMOracle.ExecutaSql('INSERT INTO TB_MENSAGEM_USUARIO_LIDA(COD_MENSAGEM_USUARIO_LIDA, '+
            'COD_MENSAGEM_USUARIO, COD_USUARIO) VALUES(SQMENSAGEM_USUARIO_LIDA.NEXTVAL, ' +
            Qu.FieldByName('COD_MENSAGEM_USUARIO').Text + ', ' +
            IntToStr(DMUsuario.CodUsuarioCorrente) + ')');
      Qu.Next;
    end;
  except
  end;
end;

Procedure TDMUsuario.TrocaSenha(wCod_Usuario : Integer; wDesc_Senha_Antiga, wDesc_Senha:String);
Var wSenhaNova, wAux : String;
Const wBranco : String = '                ';
Begin
  If wDesc_Senha_Antiga = wDesc_Senha then
    Raise Exception.Create('Senha nova igual a senha antiga!');
  QUsuario.Close;
  QUsuario.SetVariable('PK',wCod_Usuario);
  QUsuario.Open;
  If QUsuarioCod_Usuario.Value <> wCod_Usuario then
    Raise Exception.Create('Usuário inválido!')
  Else
  Begin
    wAux := wDesc_Senha_Antiga+Copy(wBranco,1,10-Length(wDesc_Senha_Antiga));
    wAux := Bib.Encode(UpperCase(wAux));
    If ( Trim(UpperCase(wDesc_Senha_Antiga)) <> UpperCase(QUsuarioDesc_Senha.Value) )
       and (wAux <> QUsuarioDesc_Senha.Value ) then
      Raise Exception.Create('Senha antiga inválida!');

    wSenhaNova := wDesc_Senha+Copy(wBranco,1,10-Length(wDesc_Senha));
    QUsuario.Edit;
    QUsuarioDesc_Senha.Value := Bib.Encode( UpperCase(wSenhaNova) );
    QUsuarioDt_Ultima_Alteracao.Value := DMOracle.DataServ;
    QUsuario.Post;
  End;
End;

procedure TDMUsuario.QUsuarioAfterEdit(DataSet: TDataSet);
begin
  QUsuarioDt_Ultima_Alteracao.Value := DMOracle.DataServ;
end;

Function TDMUsuario.BuscaUsuRede:Real;
Var
  wNomeUsuario : String;
  wTam : Cardinal;
  wString : String;
begin
  DMUsuario.QUsuarioAll.Open;
  wTam := 128;
  SetLength(wNomeUsuario,wTam);
  GetUserName( PChar(wNomeUsuario) ,wTam );
  wString := String( PChar(wNomeUsuario));
  If DMUsuario.QUsuarioAll.Locate('NOME',wString,[loCaseInsensitive,loPartialKey] ) Then
    Result := DMUsuario.QUsuarioAllCod_Usuario.Value
  Else
    Result := 0;
end;

Procedure TDMUsuario.Checar_Filial_Usuario(Cod_Filial,Modulo:String);
Var wCodigo,wModulo,wEmpresa : String;
Begin
  wEmpresa := DMOracle.BuscaNome('SELECT COD_EMPRESA FROM TB_PARAM_SISTEMA','COD_FILIAL >= ' + '0',True);
//  If wEmpresa = 'MOINHO' Then
//   Begin
     wModulo := DMOracle.BuscaNome('SELECT COD_MODULO FROM TB_MODULO','NOME_MODULO = ' + chr(39) + Trim(Modulo)+chr(39),True);
     wCodigo := DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_USUARIO_FILIAL','COD_USUARIO = ' + FloatToStr(CodUsuarioCorrente) +
                                   ' And COD_MODULO =' + wModulo,True);
     If (wCodigo <> '') Then
       If Trim(wCodigo) <> Trim(Cod_Filial) Then
          Raise Exception.Create('Usuário não liberado para operar nesta filial');
//   End;
End;

procedure TDMUsuario.QUsuarioFilialAfterPost(DataSet: TDataSet);
begin
  DMUsuario.QUsuarioFilialCons.Close;
  DMUsuario.QUsuarioFilialCons.Open;
  wCodUsuario := DMUsuario.QUsuarioFilialCOD_USUARIO.Value;
  wCodModulo := DMUsuario.QUsuarioFilialCOD_MODULO.Value;
end;

procedure TDMUsuario.QUsuarioFilialAfterDelete(DataSet: TDataSet);
begin
  DMUsuario.QUsuarioFilialCons.Close;
  DMUsuario.QUsuarioFilialCons.Open;
  wCodModulo := 0;
  wCodUsuario := 0;
end;

procedure TDMUsuario.QUsuarioFilialAfterRefreshRecord(
  Sender: TOracleDataSet);
begin
  DMUsuario.QUsuarioFilialCons.Close;
  DMUsuario.QUsuarioFilialCons.Open;
  wCodModulo := 0;
  wCodUsuario := 0;
end;

procedure TDMUsuario.QUsuarioFilialAfterInsert(DataSet: TDataSet);
begin
  If wCodUsuario  <> 0 then
    DMUsuario.QUsuarioFilialCOD_USUARIO.Value := wCodUsuario;
  If wCodModulo <> 0 then
    DMUsuario.QUsuarioFilialCOD_MODULO.Value := wCodModulo;
end;

procedure TDMUsuario.QUsuarioAfterOpen(DataSet: TDataSet);
begin
  QUsuarioPorta.Close;
  QUsuarioPorta.Open;
  QSerieModeloCons.Open;
  QSerieModeloPrazoCons.Open;
end;

procedure TDMUsuario.QUsuarioBeforeClose(DataSet: TDataSet);
begin
  QUsuarioPorta.Close;
end;

procedure TDMUsuario.QUsuarioPortaAfterInsert(DataSet: TDataSet);
begin
  if not (QUsuario.State in [DsEdit, DsInsert]) then
    DataSet.Cancel;
end;

procedure TDMUsuario.DataModuleCreate(Sender: TObject);
begin
  if Imp = nil then
    Imp := TImp.Create;
  Imp.PortaUsuarioListener := Self;
end;

function TDMUsuario.VerificaMapeamento(Porta: String): Boolean;
begin
  Result := True;
  if QUsuarioCOD_USUARIO.Value <> CodUsuarioCorrente then
  begin
    QUsuario.Close;
    QUsuario.SetVariable('PK', CodUsuarioCorrente);
    QUsuario.Open
  end
  else
  begin
    QUsuarioPorta.Close;
    QUsuarioPorta.Open;
  end;
  QUsuarioPorta.First;
  while not QUsuarioPorta.Eof do
  begin
    if QUsuarioPortaDESC_PORTA.Value = Porta then
    begin
      Bib.CancelaMapeamentoPorta(Porta);
      Result := Bib.MapearPorta(Porta, QUsuarioPortaDESC_CAMINHO.Value,
          QUsuarioPortaDESC_USUARIO.Value, QUsuarioPortaDESC_SENHA.Value);
      Break;
    end;
    QUsuarioPorta.Next;
  end;
end;

procedure TDMUsuario.QUsuarioPortaBeforeInsert(DataSet: TDataSet);
var
  Cod: Integer;
begin
  if QUsuario.State = DsInsert then
  begin
    Cod := QUsuarioCOD_USUARIO.Value;
    QUsuario.Post;
    QUsuario.Close;
    QUsuario.SetVariable('PK', Cod);
    QUsuario.Open;
  end;
  if QUsuario.State <> DsEdit then
    QUsuario.Edit;
end;

procedure TDMUsuario.QUsuarioBeforeDelete(DataSet: TDataSet);
begin
  QUsuarioPorta.First;
  while not QUsuarioPorta.Eof do
    QUsuarioPorta.Delete;
end;

procedure TDMUsuario.QUsuarioPortaBeforeDelete(DataSet: TDataSet);
begin
  if (QUsuarioCOD_USUARIO.Value = CodUsuarioCorrente) and (Trim(QUsuarioPortaDESC_PORTA.Value) <> '') then
    Bib.CancelaMapeamentoPorta(Trim(QUsuarioPortaDESC_PORTA.Value));
end;

procedure TDMUsuario.QUsuarioConsCalcFields(DataSet: TDataSet);
begin
  QUsuarioConsdesc_privilegio.Value := '';
  if QUsuarioConsIND_PRIVILEGIO.Value = 'P' then
    QUsuarioConsdesc_privilegio.Value := 'PRIVILEGIADO'
  else if QUsuarioConsIND_PRIVILEGIO.Value = 'N' then
    QUsuarioConsdesc_privilegio.Value := 'NORMAL'
  else if QUsuarioConsIND_PRIVILEGIO.Value = 'I' then
    QUsuarioConsdesc_privilegio.Value := 'INATIVO';
end;

procedure TDMUsuario.QUsuarioBeforePost(DataSet: TDataSet);
begin
  QUsuarioCOD_USUARIO_CORRENTE.Value := CodUsuarioCorrente;
  QDispositivosIND_SITUACAO.Value := DispositivoBloqueado;
end;

procedure TDMUsuario.QDispositivosCalcFields(DataSet: TDataSet);
begin
  if QDispositivosCOD_FILIAL.Text <> '' then
  begin
    QDispositivosdescfilial.Text := DMOracle.FastSelect('DESC_FILIAL','TB_FILIAL','COD_FILIAL = ' + QDispositivosCOD_FILIAL.Text);
  end;
  if QDispositivosCOD_USUARIO.Text <> '' then
  begin
    QDispositivosnomeusuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = ' + QDispositivosCOD_USUARIO.Text);
  end;
end;

procedure TDMUsuario.QDispositivosConsCalcFields(DataSet: TDataSet);
begin
  if QDispositivosConsCOD_FILIAL.Text <> '' then
  begin
    QDispositivosConsdescfilial.Text := DMOracle.FastSelect('DESC_FILIAL','TB_FILIAL','COD_FILIAL = ' + QDispositivosConsCOD_FILIAL.Text);
  end;
  if QDispositivosConsCOD_USUARIO.Text <> '' then
  begin
    QDispositivosConsnomeusuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = ' + QDispositivosConsCOD_USUARIO.Text);
  end
end;

procedure TDMUsuario.QDispositivosBeforePost(DataSet: TDataSet);
begin
  QDispositivosIND_SITUACAO.Value := fDispositivoBloqueado;
end;

end.
