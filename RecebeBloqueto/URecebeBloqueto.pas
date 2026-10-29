unit URecebeBloqueto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, Mask, DBCtrls, Buttons, ComCtrls, Menus, ExtCtrls, ToolWin,
  ImgList;

type
  TFRecebeBloqueto = class(TForm)
    EdRecebeCodBarras: TEdit;
    DSPrimario: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    MMCadastro: TMainMenu;
    MRegistro: TMenuItem;
    MRelatorios: TMenuItem;
    MRIncluir: TMenuItem;
    MRCancelar: TMenuItem;
    MRAtualizar: TMenuItem;
    MRExcluir: TMenuItem;
    MRConsultar: TMenuItem;
    N1: TMenuItem;
    MRSair: TMenuItem;
    MRAlterar: TMenuItem;
    MRConfirmar: TMenuItem;
    TtulosRecebidos1: TMenuItem;
    MAjuda: TMenuItem;
    Sobre1: TMenuItem;
    StatusBar1: TStatusBar;
    Label17: TLabel;
    EdRecebeLinhaDigitavel: TEdit;
    Label18: TLabel;
    MOperacao: TMenuItem;
    GerarArquivo1: TMenuItem;
    ImageList1: TImageList;
    Panel1: TPanel;
    SBIncluir: TSpeedButton;
    SBAlterar: TSpeedButton;
    SBConfirmar: TSpeedButton;
    SBApagar: TSpeedButton;
    SBCancelar: TSpeedButton;
    SBAtualizar: TSpeedButton;
    SBConsultar: TSpeedButton;
    MeLocaliza: TMaskEdit;
    ModificarSrie1: TMenuItem;
    Label22: TLabel;
    DBEdit16: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label16: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    EdReceber: TEdit;
    EdJuro: TEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Contedo1: TMenuItem;
    procedure EdRecebeCodBarrasExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure EdJuroExit(Sender: TObject);
    procedure EdRecebeLinhaDigitavelExit(Sender: TObject);
    procedure MRConsultarClick(Sender: TObject);
    procedure TtulosRecebidos1Click(Sender: TObject);
    procedure SBConsultarClick(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBApagarClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure SBAtualizarClick(Sender: TObject);
    procedure MRIncluirClick(Sender: TObject);
    procedure MRAlterarClick(Sender: TObject);
    procedure MRConfirmarClick(Sender: TObject);
    procedure MRExcluirClick(Sender: TObject);
    procedure MRCancelarClick(Sender: TObject);
    procedure MRAtualizarClick(Sender: TObject);
    procedure MRSairClick(Sender: TObject);
    procedure Baixar1Click(Sender: TObject);
    procedure GerarArquivo1Click(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure DBEdit3Change(Sender: TObject);
    procedure MeLocalizaExit(Sender: TObject);
    procedure ModificarSrie1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Contedo1Click(Sender: TObject);
  private
    { Private declarations }
    wstrAux, wstrNossoNumero : String;
    wintCodBanco, wintCodMoeda, wintDVCodBarras : Integer;
    wintCodAgencia, wintCodCedente, wintCarteira : Integer;
    wintFV : Integer;
    wfloValor : Real;
    Procedure Baixar();
    Procedure Incluir();
    Procedure Alterar();
    Procedure Confirmar();
    Procedure Excluir();
    Procedure Cancelar();
    Procedure Atualizar();
    Procedure Consultar();
    Procedure Sair();
    Procedure Limpar();
    Procedure ValorPagar();
    Function ValorRecebido():Real;
  public
    { Public declarations }
    FChamador : TForm;
  end;

var
  FRecebeBloqueto: TFRecebeBloqueto;


implementation

uses URecebeBloqueto_cl, URotinas, URecebeBloquetoCons,
  URecebeBloquetoParam, URRecebeBloqueto, UConta_cl, UAcesso_cl,
  UModificaSerie, USobre;

{$R *.DFM}

Procedure TFRecebeBloqueto.Baixar();
Var
  wfloAux : Real;
Begin
  With DMRecebeBloqueto Do
  Begin
    If(QRecebeBloquetoIND_SITUACAO.Text<>'B')Then
    Begin
      If(QRecebeBloquetoDT_VENCIMENTO.IsNull)Then
      Begin
        DBEdit9.SetFocus;
        raise Exception.Create('É necessário informar a Data de Vencimento');
      End;

      wfloAux := QRecebeBloquetoDT_RECEBIMENTO.Value - QRecebeBloquetoDT_VENCIMENTO.Value;
      If(wfloAux>0)Then
      Begin
        If( Trim(EdJuro.Text) = '0,00')OR(Trim(EdJuro.Text)='')Then
          if MessageDlg( 'O Título está atrasado. Deseja cobrar juros?',
                         mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            MessageDlg('Informe valor de juros diários', mtInformation,[mbOk], 0);
            EdJuro.SetFocus;
            Exit;
          end;
      End;
      QRecebeBloquetoIND_SITUACAO.Text := 'B';
      QRecebeBloquetoIND_EMITIDO.Text := 'N';
      QRecebeBloqueto.Post;
    End;
    If(QRecebeBloqueto.State in [dsInsert,dsEdit])Then
      QRecebeBloqueto.Post;
  End;
End;

Procedure TFRecebeBloqueto.Incluir();
Begin
  DMRecebeBloqueto.QRecebeBloqueto.Insert;
  Limpar();
  EdRecebeCodBarras.SetFocus;
End;

Procedure TFRecebeBloqueto.Alterar();
Begin
  DMRecebeBloqueto.QRecebeBloqueto.Edit;
End;

Procedure TFRecebeBloqueto.Confirmar();
Begin
  Baixar();
//  DMRecebeBloqueto.QRecebeBloqueto.Post;
End;

Procedure TFRecebeBloqueto.Excluir();
Begin
  if MessageDlg('Deseja Realmente APAGAR o registro?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    DMRecebeBloqueto.QRecebeBloqueto.Delete;
    Limpar();
  end;
End;

Procedure TFRecebeBloqueto.Cancelar();
Begin
  DMRecebeBloqueto.QRecebeBloqueto.Cancel;
  Limpar();
End;

Procedure TFRecebeBloqueto.Atualizar();
Var
  wintCodigo : Integer;
begin
  With DMRecebeBloqueto Do
  Begin
    If(NOT QRecebeBloquetoCOD_CONTA_RECEBER_CAB.IsNull)Then
    Begin
      wintCodigo := QRecebeBloquetoCOD_CONTA_RECEBER_CAB.Value;
      QRecebeBloqueto.Close;
      QRecebeBloqueto.ParamByName('PK').AsInteger := wintCodigo;
      QRecebeBloqueto.Open;
    End;
  End;
end;

Procedure TFRecebeBloqueto.Consultar();
Begin
  If(FRecebeBloquetoCons = Nil)Then
    FRecebeBloquetoCons := TFRecebeBloquetoCons.Create(Application);
  If(FRecebeBloquetoCons.ShowModal = mrOk)Then
  Begin
    DMRecebeBloqueto.QRecebeBloqueto.Close;
    DMRecebeBloqueto.QRecebeBloqueto.ParamByName('PK').AsInteger := DMRecebeBloqueto.QRecebeBloquetoConsCOD_CONTA_RECEBER_CAB.Value;
    DMRecebeBloqueto.QRecebeBloqueto.Open;
  End;
End;

Procedure TFRecebeBloqueto.Sair();
Begin
  Close;
End;

Procedure TFRecebeBloqueto.Limpar();
Begin
  EdRecebeCodBarras.Clear;
  EdRecebeLinhaDigitavel.Clear;
  EdJuro.Clear;
  EdReceber.Clear;
End;

Procedure TFRecebeBloqueto.ValorPagar();
begin
  With DMRecebeBloqueto Do
    EdReceber.Text := FormatFloat( '###,##0.00;;Zero ',
    (QRecebeBloquetoVAL_TITULO.Value + QRecebeBloquetoVAL_JUROS.Value - QRecebeBloquetoVAL_DESCONTO.Value)
    );
end;

Function TFRecebeBloqueto.ValorRecebido():Real;
Begin
  With DMRecebeBloqueto Do
    Result := (QRetornoVAL_TITULO.Value + QRetornoVAL_JUROS.Value - QRetornoVAL_DESCONTO.Value);
End;

procedure TFRecebeBloqueto.EdRecebeCodBarrasExit(Sender: TObject);
Var
  Rot : TRotinas;
begin
  If(Trim(EdRecebeCodBarras.Text)<>'')Then
  Begin
    Rot := TRotinas.Create;
    wstrAux := EdRecebeCodBarras.Text;
    If(Rot.Modulo11BB_CBarra( Copy(wstrAux,1,4) + Copy(wstrAux,6,39) ) <> Copy(wstrAux,5,1))Then
      raise Exception.Create('Dígito Verificador do Código de Barras Inválido');
    wintCodBanco := StrToInt( Copy(wstrAux,1,3) );
    wintCodMoeda := StrToInt( Copy(wstrAux,4,1) );
    wintDVCodBarras := StrToInt( Copy(wstrAux,5,1) );
    wintFV := StrToInt( Copy(wstrAux,6,4) );
    wfloValor := StrToFloat( Copy(wstrAux,10,10) )/100;
    wstrNossoNumero := Copy(wstrAux,20,11);
    wintCodAgencia := StrToInt( Copy(wstrAux,31,4) );
    wintCodCedente := StrToInt( Copy(wstrAux,35,8) );
    wintCarteira := StrToInt( Copy(wstrAux,43,2) );

    With DMRecebeBloqueto Do
    Begin
      If(QRecebeBloqueto.State <> dsInsert)Then
        QRecebeBloqueto.Insert;
      QRecebeBloquetoCOD_BANCO.Value := wintCodBanco;
      QRecebeBloquetoCOD_MOEDA.Value := wintCodMoeda;
      QRecebeBloquetoVAL_TITULO.Value := wfloValor;
      QRecebeBloquetoNOSSO_NUMERO.Value := wstrNossoNumero;
      QRecebeBloquetoCOD_AGENCIA.Value := wintCodAgencia;
      QRecebeBloquetoNUM_CONTA.Value := wintCodCedente;
      QRecebeBloquetoCOD_CARTEIRA.Value := wintCarteira;
      QRecebeBloquetoDT_VENCIMENTO.Value := ( StrToDate('03/07/2000') + wintFV - 1000);
      QRecebeBloquetoDT_RECEBIMENTO.Value := Date;
    End;
    DBEdit2.SetFocus;
  End;
end;

procedure TFRecebeBloqueto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  If(DSPrimario.State in [DsInsert,DsEdit])Then
    raise Exception.Create('Dados não Confirmados: Confirme ou Cancele Operação');
  DMRecebeBloqueto.QRecebeBloqueto.Close;
  DMRecebeBloqueto.QRecebeBloquetoCons.Close;
  FChamador.Visible := True;
  Action := CaFree;
  FRecebeBloqueto := nil;
end;

procedure TFRecebeBloqueto.FormActivate(Sender: TObject);
begin
  FChamador.Hide;
  DMRecebeBloqueto.QRecebeBloqueto.Open;
end;

procedure TFRecebeBloqueto.EdJuroExit(Sender: TObject);
begin
  With DMRecebeBloqueto Do
  Begin
    If(QRecebeBloqueto.State in [DsInsert,DsEdit])Then
    begin
      QRecebeBloquetoVAL_JUROS.Value := StrToFloat(Trim(EdJuro.Text)) * QRecebeBloquetoVAL_TITULO.Value / 100 *
                                        (QRecebeBloquetoDT_RECEBIMENTO.Value - QRecebeBloquetoDT_VENCIMENTO.Value);
      EdReceber.Text := 'R$ ' + FormatFloat('###,##0.00',QRecebeBloquetoVAL_TITULO.Value + QRecebeBloquetoVAL_JUROS.Value);
    End;
  End;
end;

procedure TFRecebeBloqueto.EdRecebeLinhaDigitavelExit(Sender: TObject);
Var
  Rot : TRotinas;
  wstrAuxCB : String;
begin
  If(Trim(EdRecebeLinhaDigitavel.Text)<>'')Then
  Begin
    Rot := TRotinas.Create;
    wstrAux := EdRecebeLinhaDigitavel.Text;
    If( Length(wstrAux)<>47 )AND( Length(wstrAux)<>44 )Then
      raise Exception.Create('Linha Digitável fora dos padrões');

    wintCodBanco := StrToInt( Copy(wstrAux,1,3) );
    wintCodMoeda := StrToInt( Copy(wstrAux,4,1) );
    wstrNossoNumero := Copy(wstrAux,5,5) + Copy(wstrAux,11,6);
    wintCodAgencia := StrToInt( Copy(wstrAux,17,4) );
    wintCodCedente := StrToInt( Copy(wstrAux,22,8) );
    wintCarteira := StrToInt( Copy(wstrAux,30,2) );
    wintDVCodBarras := StrToInt( Copy(wstrAux,33,1) );
    wintFV := StrToInt( Copy(wstrAux,34,4) );
    If( Length(wstrAux)=47 )Then
      wfloValor := StrToFloat( Copy(wstrAux,38,14) )/100
    Else
      wfloValor := StrToFloat( Copy(wstrAux,38,3) )/100;

    wstrAuxCB := Copy(wstrAux,1,4) + Copy(wstrAux,34,4) + Copy(wstrAux,38,10) + wstrNossoNumero + Copy(wstrAux,17,4) +
       Copy(wstrAux,22,8) + Copy(wstrAux,30,2);

    If( Rot.Modulo11BB_CBarra(wstrAuxCB)<>Copy(wstrAux,33,1) )Then
      raise Exception.Create('Dígito Verificador do Código de Barras Inválido');
    If(Rot.Modulo10( Copy(wstrAux,1,9) ) <> Copy(wstrAux,10,1))Then
      raise Exception.Create('Dígito Verificador da Linha Digitável Inválido');
    If(Rot.Modulo10( Copy(wstrAux,11,10) ) <> Copy(wstrAux,21,1))Then
      raise Exception.Create('Dígito Verificador da Linha Digitável Inválido');
    If(Rot.Modulo10( Copy(wstrAux,22,10) ) <> Copy(wstrAux,32,1))Then
      raise Exception.Create('Dígito Verificador da Linha Digitável Inválido');

    With DMRecebeBloqueto Do
    Begin
      If(QRecebeBloqueto.State <> dsInsert)Then
        QRecebeBloqueto.Insert;
      QRecebeBloquetoCOD_BANCO.Value := wintCodBanco;
      QRecebeBloquetoCOD_MOEDA.Value := wintCodMoeda;
      QRecebeBloquetoVAL_TITULO.Value := wfloValor;
      QRecebeBloquetoNOSSO_NUMERO.Value := wstrNossoNumero;
      QRecebeBloquetoCOD_AGENCIA.Value := wintCodAgencia;
      QRecebeBloquetoNUM_CONTA.Value := wintCodCedente;
      QRecebeBloquetoCOD_CARTEIRA.Value := wintCarteira;
      QRecebeBloquetoDT_RECEBIMENTO.Value := Date;
      QRecebeBloquetoDT_VENCIMENTO.Value := ( StrToDate('03/07/2000') + wintFV - 1000);
    End;
  End;
end;

procedure TFRecebeBloqueto.MRConsultarClick(Sender: TObject);
begin
  Consultar();
end;

procedure TFRecebeBloqueto.TtulosRecebidos1Click(Sender: TObject);
Var
  wstrDtVenc, wstrDtRec : String;
begin
  wstrDtVenc := '';
  wstrDtRec := '';

  If(FRecebeBloquetoParam = nil)Then
    FRecebeBloquetoParam := TFRecebeBloquetoParam.Create(Application);
  FRecebeBloquetoParam.PGRelatorio.Pages[0].Visible := True;
  If(FRecebeBloquetoParam.showmodal = mrOk)Then
  Begin
    With DMRecebeBloqueto Do
    Begin
      QRRecebeBloqueto.Close;

      If( Trim(FRecebeBloquetoParam.MENumConta.Text) <> '' )Then
        QRRecebeBloqueto.ParamByName('NUM_CONTA').AsInteger := StrToInt( Trim(FRecebeBloquetoParam.MENumConta.Text) )
      Else
        QRRecebeBloqueto.ParamByName('NUM_CONTA').AsInteger := 0;

      If( Trim(FRecebeBloquetoParam.MeNossoNumero.Text) <> '' )Then
        QRRecebeBloqueto.ParamByName('NN').AsString := Trim(FRecebeBloquetoParam.MeNossoNumero.Text)
      Else
        QRRecebeBloqueto.ParamByName('NN').AsString := '';

      If( Trim(FRecebeBloquetoParam.MeDtRecInicial.Text) <> '' )Then
      Begin
        wstrDtRec := ' - De títulos recebidos entre ' + FRecebeBloquetoParam.MeDtRecInicial.Text;
        QRRecebeBloqueto.ParamByName('DT_REC_INI').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.MeDtRecInicial.Text) )
      End
      Else
        QRRecebeBloqueto.ParamByName('DT_REC_INI').AsDateTime := StrToDate('01/01/1900');

      If( Trim(FRecebeBloquetoParam.MeDtRecFinal.Text) <> '' )Then
      Begin
        wstrDtRec := wstrDtRec + ' Até ' + FRecebeBloquetoParam.MeDtRecFinal.Text;
        QRRecebeBloqueto.ParamByName('DT_REC_FIN').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.MeDtRecFinal.Text) )
      End
      Else
        QRRecebeBloqueto.ParamByName('DT_REC_FIN').AsDateTime := StrToDate('01/01/2030');

      If( Trim(FRecebeBloquetoParam.MeDtVencInicial.Text) <> '' )Then
      Begin
        wstrDtVenc := 'Com vencimento entre ' + FRecebeBloquetoParam.MeDtVencInicial.Text;
        QRRecebeBloqueto.ParamByName('DT_VENC_INI').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.MeDtVencInicial.Text) )
      End
      Else
        QRRecebeBloqueto.ParamByName('DT_VENC_INI').AsDateTime := StrToDate('01/01/1900');

      If( Trim(FRecebeBloquetoParam.MeDtVencFinal.Text) <> '' )Then
      Begin
        wstrDtVenc := wstrDtVenc + ' Até ' + FRecebeBloquetoParam.MeDtVencFinal.Text;
        QRRecebeBloqueto.ParamByName('DT_VENC_FIN').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.MeDtVencFinal.Text) )
      End
      Else
        QRRecebeBloqueto.ParamByName('DT_VENC_FIN').AsDateTime := StrToDate('01/01/2030');

      QRRecebeBloqueto.Open;
      If(NOT QRRecebeBloqueto.IsEmpty)Then
      Begin
        If(FRRecebeBloqueto = nil)Then
          FRRecebeBloqueto := TFRRecebeBloqueto.Create(Application);
        FRRecebeBloqueto.QRLbPeriodo.Caption := wstrDtVenc + wstrDtRec;
        FRRecebeBloqueto.QRLbEmpresa.Caption := DMConta.QContaNOME_CEDENTE.Text;
        If(FRecebeBloquetoParam.RGPreview.ItemIndex = 0)Then
          FRRecebeBloqueto.QRPrimario.Preview
        Else
          FRRecebeBloqueto.QRPrimario.Print;
      End
      Else
        MessageDlg('Não existem dados a serem apresentados com os parâmetros informados', mtInformation,
        [mbOk], 0);
      QRRecebeBloqueto.Close;
    End;
  End
end;

procedure TFRecebeBloqueto.SBConsultarClick(Sender: TObject);
begin
  Consultar();
end;

procedure TFRecebeBloqueto.SBIncluirClick(Sender: TObject);
begin
  Incluir();
end;

procedure TFRecebeBloqueto.SBAlterarClick(Sender: TObject);
begin
  Alterar();
end;

procedure TFRecebeBloqueto.SBConfirmarClick(Sender: TObject);
begin
  Confirmar();
end;

procedure TFRecebeBloqueto.SBApagarClick(Sender: TObject);
begin
  Excluir();
end;

procedure TFRecebeBloqueto.SBCancelarClick(Sender: TObject);
begin
  Cancelar();
end;

procedure TFRecebeBloqueto.SBAtualizarClick(Sender: TObject);
begin
  Atualizar();
end;

procedure TFRecebeBloqueto.MRIncluirClick(Sender: TObject);
begin
  Incluir();
end;

procedure TFRecebeBloqueto.MRAlterarClick(Sender: TObject);
begin
  Alterar();
end;

procedure TFRecebeBloqueto.MRConfirmarClick(Sender: TObject);
begin
  Confirmar();
end;

procedure TFRecebeBloqueto.MRExcluirClick(Sender: TObject);
begin
  Excluir();
end;

procedure TFRecebeBloqueto.MRCancelarClick(Sender: TObject);
begin
  Cancelar();
end;

procedure TFRecebeBloqueto.MRAtualizarClick(Sender: TObject);
begin
  Atualizar();
end;

procedure TFRecebeBloqueto.MRSairClick(Sender: TObject);
begin
  Sair();
end;

procedure TFRecebeBloqueto.Baixar1Click(Sender: TObject);
begin
  Baixar();
end;

procedure TFRecebeBloqueto.GerarArquivo1Click(Sender: TObject);
Var
  wstrS,wstrPreFixoTitulo              : String;
  wstrAux,wstrNulo                     : String;
  F                                    : TextFile;
  wintContador                         : Integer;
  wfloValRecebido,wfloValTotal         : Real;
  Rot                                  : TRotinas;
begin
  If(FRecebeBloquetoParam = nil)Then
    FRecebeBloquetoParam := TFRecebeBloquetoParam.Create(Application);
  FRecebeBloquetoParam.PGRelatorio.Pages[1].Visible := True;
  If(FRecebeBloquetoParam.ShowModal = mrOk)Then
  Begin
    With DMRecebeBloqueto Do
    Begin
      QRetorno.Close;
      If( Trim(FRecebeBloquetoParam.Me1DtRecInicial.Text)='' )Then
        QRetorno.ParamByName('DT_REC_INICIAL').AsDateTime := StrToDate('01/01/1900')
      Else
        QRetorno.ParamByName('DT_REC_INICIAL').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.Me1DtRecInicial.Text) );

      If( Trim(FRecebeBloquetoParam.Me1DtRecFinal.Text)='' )Then
        QRetorno.ParamByName('DT_REC_FINAL').AsDateTime := StrToDate('01/01/2030')
      Else
        QRetorno.ParamByName('DT_REC_FINAL').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.Me1DtRecFinal.Text) );

      If( Trim(FRecebeBloquetoParam.Me1DtVencInicial.Text)='' )Then
        QRetorno.ParamByName('DT_VENC_INICIAL').AsDateTime := StrToDate('01/01/1900')
      Else
        QRetorno.ParamByName('DT_VENC_INICIAL').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.Me1DtVencInicial.Text) );

      If( Trim(FRecebeBloquetoParam.Me1DtVencFinal.Text)='' )Then
        QRetorno.ParamByName('DT_VENC_FINAL').AsDateTime := StrToDate('01/01/2030')
      Else
        QRetorno.ParamByName('DT_VENC_FINAL').AsDateTime := StrToDate( Trim(FRecebeBloquetoParam.Me1DtVencFinal.Text) );
      QRetorno.Open;

      If(QRetorno.RecordCount = 0)Then
        raise Exception.Create('Não há nenhum título recebido no período');
    End;

    wintContador := 2;
    Rot := TRotinas.Create;
    Try
      DMAcesso.DBAcesso.StartTransaction;
        {Formação do Registro Header}
        wstrS := '';
{01-06} wstrS := '02RETORNO01COBRANCA       ' +
{07-07}          Rot.RMaskCGC_CPF( DMConta.QContaCOD_AGENCIA.Text,4 ) +
{08-08}          Rot.RMaskCGC_CPF( DMConta.QContaDV_AGENCIA.Text,1 ) +
{09-09}          Rot.RMaskCGC_CPF( DMConta.QContaNUM_CONTA.Text,8 ) +
{10-10}          Rot.RMaskCGC_CPF( DMConta.QContaDV_CONTA.Text,1 ) +
{11-11}          Rot.FormataTexto( DMConta.QContaNUM_CONVENIO.Text,6 ) +
{12-12}          Rot.FormataTexto( UpperCase(DMConta.QContaNOME_CEDENTE.Text),30 ) +
{13-13}          '001BANCO DO BRASIL' +
{14-14}          FormatDateTime('DDMMYY',Date) +
{15-15}          Rot.RMaskCGC_CPF( DMConta.QContaVAL_SERIE_ARQUIVO.Text,7 ) +
{16-16}          Rot.FormataTexto( ' ',287 ) +
{17-17}          '000001' +  Chr(13)+Chr(10);
//    DMRecebeBloqueto.QRecebeBloqueto.Next;

      // Prefixo do titulo \\
      Case DMConta.QContaCOD_CARTEIRA.Value of
        11,13,15,17: wstrPrefixoTitulo := 'AI ';
        12: wstrPrefixoTitulo := 'AIU';
        31,51,54: wstrPrefixoTitulo := 'SD ';
      Else
        wstrPrefixoTitulo := '   ';
      End;

    wfloValTotal := 0;
    //wfloValRecebido := 0;

    {Formação do Registro Detalhe}
    DMRecebeBloqueto.QRetorno.First;
    While(NOT DMRecebeBloqueto.QRetorno.Eof)Do
    Begin
      wfloValRecebido := ValorRecebido();
      wfloValTotal := wfloValTotal + wfloValRecebido;
{01-01} wstrS := wstrS + '1';
{02-02} If( DMConta.QContaIND_FISICA_JURIDICA.Text = 'F' )Then
          wstrS := wstrS + '01'
        Else
          wstrS := wstrS + '02';
{03-03} wstrS := wstrS + Rot.RMaskCGC_CPF( DMConta.QContaNUM_CGC_CPF.Text,14 ) +
{04-04}          Rot.RMaskCGC_CPF( DMConta.QContaCOD_AGENCIA.Text,4 ) +
{05-05}          Rot.RMaskCGC_CPF( DMConta.QContaDV_AGENCIA.Text,1 ) +
{06-06}          Rot.RMaskCGC_CPF( DMConta.QContaNUM_CONTA.Text,8 ) +
{07-07}          Rot.RMaskCGC_CPF( DMConta.QContaDV_CONTA.Text,1 ) +
{08-08}          Rot.RMaskCGC_CPF( DMConta.QContaNUM_CONVENIO.Text,6 ) +
{09-09}          Rot.FormataTexto( DMRecebeBloqueto.QRetornoNUM_TITULO.Text,25 ) +
{10-10}          Rot.RMaskCGC_CPF( DMRecebeBloqueto.QRetornoNOSSO_NUMERO.Text,11 ) +
{11-11}          Rot.RMaskCGC_CPF( DMRecebeBloqueto.QRetornoDV_NOSSO_NUMERO.Text,1 ) +
{12-15}          '00000001' + wstrPrefixoTitulo +
{16-16}          Rot.RMaskCGC_CPF( DMConta.QContaCOD_VARIACAO.Text,3 ) +
{17-22}          '0' + '00000' + '0' + '00000' + '00000' + ' ' +
{23-23}          Rot.RMaskCGC_CPF( DMConta.QContaCOD_CARTEIRA.Text,2 ) +
{24-24}          Rot.RMaskCGC_CPF( DMConta.QContaCOD_COMANDO.Text,2 ) +
{25-25}          FormatDateTime( 'DDMMYY',DMRecebeBloqueto.QRetornoDT_RECEBIMENTO.Value ) +
{26-26}          Rot.FormataTexto( DMRecebeBloqueto.QRetornoNUM_TITULO.Text,10 ) +
{27-27}          Rot.FormataTexto( ' ',20 ) +
{28-28}          FormatDateTime( 'DDMMYY',DMRecebeBloqueto.QRetornoDT_VENCIMENTO.Value ) +
{29-29}          Rot.RMaskCGC_CPF( DMRecebeBloqueto.QRetornoVAL_TITULO.Text,13 ) +
{30-30}          '001' +
{31-31}          Rot.RMaskCGC_CPF( DMRecebeBloqueto.QRetornoCOD_AGENCIA.Text,4 ) +
{32-32}          Rot.FormataTexto( DMRecebeBloqueto.QRetornoDV_AGENCIA.Text,1 ) +
{33-33}          '01' +
{34-34}          FormatDateTime( 'DDMMYY',DMRecebeBloqueto.QRetornoDT_RECEBIMENTO.Value ) +
{35-35}          '0000000' +
{36-36}          '0000000000000' +
{37-37}          '0000000000000' +
{38-38}          '0000000000000' +
{39-39}          '0000000000000' +
{40-40}          Rot.IntDecimais( DMRecebeBloqueto.QRetornoVAL_DESCONTO.Text,13,2 ) +
{41-41}          Rot.IntDecimais( FloatToStr( wfloValRecebido ),13,2 ) +
{42-42}          Rot.IntDecimais( DMRecebeBloqueto.QRetornoVAL_JUROS.Text,13,2 ) +
{43-43}          '0000000000000' +
{44-44}          '0000000000000' +
{45-45}          Rot.IntDecimais( FloatToStr(wfloValRecebido),13,2 ) +
{47-49}          '11' + '000000000000' + '          ' +
{50-50}          Rot.StrZero( '0',52 ) +
{51-51}          Rot.RMaskCGC_CPF( IntToStr(wintContador),6 ) + Chr(13)+ Chr(10);
      wstrAux := 'UPDATE TB_CONTA_RECEBER_CAB SET IND_EMITIDO = ' +CHR(39)+ 'S' +CHR(39)+
                 ' WHERE COD_CONTA_RECEBER_CAB = ' + DMRecebeBloqueto.QRetornoCOD_CONTA_RECEBER_CAB.Text;
      DMAcesso.ExecutaSql(wstrAux);
      DMRecebeBloqueto.QRetorno.Next;
    End;

        wstrAux := Rot.RMaskCGC_CPF( IntToStr(DMRecebeBloqueto.QRetorno.RecordCount),8 ) +
                   Rot.IntDecimais( FloatToStr(wfloValTotal),14,2 ) + '00000000          ';

        wstrNulo := Rot.StrZero('0',30) + '          ';

        Inc(wintContador);
        {Formação do Registro Trailer}
{01-05} wstrS := wstrS + '9201001          ';
        Case DMConta.QContaCOD_CARTEIRA.Value Of
          31: wstrS := wstrS + wstrNulo + wstrAux + wstrNulo + wstrNulo;
          51: wstrS := wstrS + wstrNulo + wstrNulo + wstrNulo + wstrAux;
        Else
          wstrS := wstrS + wstrAux + wstrNulo + wstrNulo + wstrNulo;
        End;
        wstrS := wstrS + Rot.FormataTexto( ' ',217 ) +
                 Rot.RMaskCGC_CPF( IntToStr(wintContador),6 ) + Chr(13)+Chr(10);


        //------------------ Fim --------------------------\\
        wstrAux := 'UPDATE TB_CONTA SET VAL_SERIE_ARQUIVO = ' + IntToStr( (DMConta.QContaVAL_SERIE_ARQUIVO.Value + 1) ) +
                   'WHERE COD_CONTA = ' + DMConta.QContaCOD_CONTA.Text;
        DMAcesso.ExecutaSql(wstrAux);
        DMConta.QConta.Close;
        DMConta.QConta.Open;

        wstrAux := 'UPDATE TB_PARAM_SISTEMA SET DT_ULTIMA_REMESSA = ' +CHR(39)+ FormatDateTime('MM/DD/YYYY',Date) +CHR(39)+
                   'WHERE COD_PARAM_SISTEMA = ' + DMAcesso.QParamSistemaCOD_PARAM_SISTEMA.Text;
        DMAcesso.ExecutaSql(wstrAux);
        DMAcesso.QParamSistema.Close;
        DMAcesso.QParamSistema.Open;

        wstrAux := FormatDateTime('DDMMYY', Date) +
                   Rot.RMaskCGC_CPF( DMConta.QContaNUM_CONTA.Text,8 ) + '.RET';
        FRecebeBloquetoParam.SDlg_Remessa.FileName:= wstrAux;
        FRecebeBloquetoParam.SDlg_Remessa.Filter := 'Arquivo de Retorno Banco do Brasil';
        FRecebeBloquetoParam.SDlg_Remessa.DefaultExt := '';
        FRecebeBloquetoParam.SDlg_Remessa.FilterIndex := 0;

        if FRecebeBloquetoParam.SDlg_Remessa.Execute then
        begin
          AssignFile( F, FRecebeBloquetoParam.SDlg_Remessa.FileName );
          Rewrite(F);
          Writeln(F, wstrS);
          CloseFile(F);
          DMAcesso.DBAcesso.Commit;
          MessageDlg('Arquivo RETORNO-CBR 643 Gerado com Sucesso!', mtInformation,[mbOk], 0);
        end
        else
        Begin
          MessageDlg('Arquivo RETORNO-CBR 643 não foi Gerado!', mtWarning,[mbOk], 0);
          DMAcesso.DBAcesso.Rollback;
        End
    except
      DMAcesso.DBAcesso.Rollback;
      raise exception.create('Erro! Não foi possível gerar o arquivo de remessa,'+#13+
                                  'Verifique se não existem campos em branco no cadastro de bancos'+#13+
                                  'ou no cadastro de Títulos.');
    end;

  End;
end;

procedure TFRecebeBloqueto.DSPrimarioStateChange(Sender: TObject);
begin
  If DSPrimario.DataSet.State in [dsEdit,dsInsert] then
  Begin
    SBIncluir.Enabled := False;
    SBAlterar.Enabled := False;
    SBApagar.Enabled := False;
    SBConfirmar.Enabled := True;
    SBCancelar.Enabled := True;
    SBAtualizar.Enabled := False;
    MELocaliza.Enabled := False;
    SBConsultar.Enabled := False;
  End
  Else
  If DSPrimario.DataSet.State = dsBrowse then
  Begin
    SBIncluir.Enabled := True;
    SBAlterar.Enabled := True;
    SBApagar.Enabled := True;
    SBConfirmar.Enabled := False;
    SBCancelar.Enabled := False;
    SBAtualizar.Enabled := True;
    MELocaliza.Enabled := True;
    SBConsultar.Enabled := True;
  End;
  MMCadastro.Items[0].Items[0].Enabled := SBIncluir.Enabled;
  MMCadastro.Items[0].Items[1].Enabled := SBAlterar.Enabled;
  MMCadastro.Items[0].Items[2].Enabled := SBConfirmar.Enabled;
  MMCadastro.Items[0].Items[3].Enabled := SBApagar.Enabled;
  MMCadastro.Items[0].Items[4].Enabled := SBCancelar.Enabled;
  MMCadastro.Items[0].Items[5].Enabled := SBAtualizar.Enabled;
  MMCadastro.Items[0].Items[6].Enabled := SBConsultar.Enabled;
  MMCadastro.Items[0].Items[8].Enabled := SBAtualizar.Enabled; // Sair
  MMCadastro.Items[1].Enabled := SBAtualizar.Enabled; // Relatorio
  MMCadastro.Items[2].Enabled := SBAtualizar.Enabled; // Relatorio  
end;

procedure TFRecebeBloqueto.DBEdit5Change(Sender: TObject);
begin
  ValorPagar();
end;

procedure TFRecebeBloqueto.DBEdit4Change(Sender: TObject);
begin
  ValorPagar();
end;

procedure TFRecebeBloqueto.DBEdit3Change(Sender: TObject);
begin
  ValorPagar();
end;

procedure TFRecebeBloqueto.MeLocalizaExit(Sender: TObject);
begin
  If(Trim(MeLocaliza.Text)<>'')Then
  Begin
    With DMRecebeBloqueto Do
    Begin
      QRecebeBloqueto.Close;
      QRecebeBloqueto.ParamByName('PK').AsInteger := StrToInt( Trim(MeLocaliza.Text) );
      QRecebeBloqueto.Open;
    End;
    MeLocaliza.Clear;
  End;
end;

procedure TFRecebeBloqueto.ModificarSrie1Click(Sender: TObject);
begin
  If(FModificaSerie = nil)Then
    FModificaSerie := TFModificaSerie.Create(Application);
  FModificaSerie.showmodal;
end;

procedure TFRecebeBloqueto.Sobre1Click(Sender: TObject);
begin
  If(FSobre = nil)Then
    FSobre := TFSobre.Create(Application);
  FSobre.showmodal
end;

procedure TFRecebeBloqueto.Contedo1Click(Sender: TObject);
begin
  Application.HelpContext(3);
end;

end.
