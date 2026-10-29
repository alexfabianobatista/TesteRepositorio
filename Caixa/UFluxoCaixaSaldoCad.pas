unit UFluxoCaixaSaldoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFFluxoCaixaSaldoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    BtFilialCons: TSpeedButton;
    BtDeptoCons: TSpeedButton;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    FluxodeCaixa1: TMenuItem;
    FluxoCaixaAnaltico1: TMenuItem;
    procedure BtFilialConsClick(Sender: TObject);
    procedure BtDeptoConsClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FluxodeCaixa1Click(Sender: TObject);
    procedure FluxoCaixaAnaltico1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFluxoCaixaSaldoCad: TFFluxoCaixaSaldoCad;

implementation

uses UFluxoCaixa_cl, UFilialCons, UDepartamentoCons, UFluxoCaixaSaldoCons,
  UFilial_cl, UDepartamento_cl, UCaixaParam, UUsuario_cl, URFluxoCaixa,
  URFluxoCaixaAnalitico, UMensagem_cl, UOracle_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFFluxoCaixaSaldoCad.BtFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    DMFluxoCaixa.QFluxoCaixaSaldoCOD_FILIAL.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFFluxoCaixaSaldoCad.BtDeptoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=MrOk then
    DMFluxoCaixa.QFluxoCaixaSaldoCOD_DEPARTAMENTO.Value:= DMDepartamento.QDepartamentoConsCod_Departamento.Value;

end;

procedure TFFluxoCaixaSaldoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFluxoCaixaSaldoCons = Nil Then
     FFluxoCaixaSaldoCons := TFFluxoCaixaSaldoCons.Create(Application);
  If FFluxoCaixaSaldoCons.ShowModal = MrOk Then
   Begin
     With DMFluxoCaixa Do
     Begin
       QFluxoCaixaSaldo.Close;
       QFluxoCaixaSaldo.SetVariable('PK',QFluxoCaixaSaldoConsCod_Fluxo_Caixa_Saldo.Value);
       QFluxoCaixaSaldo.Open;
     End;
   End;   
end;

procedure TFFluxoCaixaSaldoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMFilial.QFilialCons.Close;
  DMDepartamento.QDepartamentoCons.Close;
  DMFluxoCaixa.QFluxoCaixaSaldo.Close;
  DMFluxoCaixa.QFluxoCaixaSaldoCons.Close;
  Action:= CaFree;
  FFluxoCaixaSaldoCad:= Nil;

end;

procedure TFFluxoCaixaSaldoCad.FormActivate(Sender: TObject);
begin
//  inherited;
  DMFluxoCaixa.QFluxoCaixaSaldo.Open;
end;

procedure TFFluxoCaixaSaldoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
    begin
      BtFilialCons.Enabled:=True;
      BtDeptoCons.Enabled:=True;
    end
  Else
    begin
      BtFilialCons.Enabled:=False;
      BtDeptoCons.Enabled:=False;
    end;

end;

procedure TFFluxoCaixaSaldoCad.FluxodeCaixa1Click(Sender: TObject);
Var wSaldo : real;
    wObs : String;
begin
  inherited;
  //para gerar esse relatório deve ser lançado o dolar do dia
  //o código abaixo verifica se houve esse lançamento
  if DMOracle.BuscaNome('SELECT VLR_COTACAO FROM TB_COTACAO','COD_MOEDA = 2 AND DT_COTACAO = TRUNC(SYSDATE)' ) = '' then
    raise Exception.Create('Para gerar esse relatório deve ser lançado o valor do Dólar para a data de hoje.');

  If FCaixaParam=Nil then
    FCaixaParam:=TFCaixaParam.Create(Application);
  FCaixaParam.PGRelatorio.Pages[9].TabVisible:=True;
  If FCaixaParam.ShowModal=MrOk then
  begin
    DmUsuario.Checar_Filial_Usuario(Trim(FCaixaParam.Me5CodFilial.Text),'CAIXA'); //Segurança de Filial
     with DMFluxoCaixa do
     begin
       QrFluxoCaixa.Close;
       QSaldoFluxoCaixa_Dt.Close;
       if Trim(FCaixaParam.ME9Filial.Text)<>'' then
        Begin
          QrFluxoCaixa.SetVariable('COD_FILIAL',StrToInt(Trim(FCaixaParam.ME9Filial.Text)));
          QSaldoFluxoCaixa_Dt.SetVariable('COD_FILIAL',StrToInt(Trim(FCaixaParam.ME9Filial.Text)));
        End
       else
        Begin
          QrFluxoCaixa.SetVariable('COD_FILIAL',Null);
          QSaldoFluxoCaixa_Dt.SetVariable('COD_FILIAL',Null);
        End;
       if Trim(FCaixaParam.Me9Departamento.Text)<>'' then
        Begin
          QrFluxoCaixa.SetVariable('COD_DEPARTAMENTO',StrToInt(Trim(FCaixaParam.Me9Departamento.Text)));
          QSaldoFluxoCaixa_Dt.SetVariable('COD_DEPARTAMENTO',StrToInt(Trim(FCaixaParam.Me9Departamento.Text)))
        End
       else
        Begin
          QrFluxoCaixa.SetVariable('COD_DEPARTAMENTO',Null);
          QSaldoFluxoCaixa_Dt.SetVariable('COD_DEPARTAMENTO',Null);
        End;
       QrFluxoCaixa.SetVariable('DT_INICIO',StrToDate(Trim(FCaixaParam.ME9DtInicio.Text)));
       QrFluxoCaixa.SetVariable('DT_FINAL',StrToDate(Trim(FCaixaParam.ME9DtFim.Text)));
       QSaldoFluxoCaixa_Dt.SetVariable('DT_FLUXO_CAIXA_SALDO',StrToDate(Trim(FCaixaParam.ME9DtInicio.Text)));
       QrFluxoCaixa.Open;
       QSaldoFluxoCaixa_Dt.Open;
       wSaldo := 0;
       wObs := '';
       While Not (QSaldoFluxoCaixa_Dt.Eof) Do
        Begin
          wSaldo := wSaldo + QSaldoFluxoCaixa_DtVal_Saldo.Value;
          wObs := wObs + QSaldoFluxoCaixa_DtDesc_Observacao.Value;
          QSaldoFluxoCaixa_Dt.Next;
        End;
       if FRFluxoCaixa = Nil then
          FRFluxoCaixa:=tFRFluxoCaixa.Create(Application);
       FRFluxoCaixa.QRLFilial.Caption:='Filial:'+FCaixaParam.Ed9Filial.Text+'   Periodo de: '+FCaixaParam.ME9DtInicio.Text+' até: '+FCaixaParam.ME9DtFim.Text;
       FRFluxoCaixa.QRLAnterior.Caption :=  FormatFloat('##,###,##0.00',wSaldo);
       pSaldoAnterior := wSaldo;
       FRFluxoCaixa.QRLObservacao.Caption := wObs;
       If Trim(FCaixaParam.Me9Mensagem.Text) <> '' Then
       Begin
         DMMensagem.QMensagem.Close;
         DMMensagem.QMensagem.SetVariable('Pk',FCaixaParam.Me9Mensagem.Text);
         DMMensagem.QMensagem.Open;
         FRFluxoCaixa.QRLMensagem1.Caption := Trim(DMMensagem.QMensagemDesc_Mensagem.Value)+ ' '+Trim(DMMensagem.QMensagemDesc_Complemento.Value);
         FRFluxoCaixa.QRLMensagem2.Caption := Trim(DMMensagem.QMensagemDesc_Complemento1.Value) + ' '+Trim(DMMensagem.QMensagemDesc_Complemento2.Value);
         FRFluxoCaixa.QRLMensagem3.Caption := Trim(DMMensagem.QMensagemDesc_Complemento3.Value) + ' '+Trim(DMMensagem.QMensagemDesc_Complemento4.Value);
         FRFluxoCaixa.QRLMensagem4.Caption := Trim(DMMensagem.QMensagemDesc_Complemento5.Value) + ' '+Trim(DMMensagem.QMensagemDesc_Complemento6.Value);
         FRFluxoCaixa.QRLMensagem5.Caption := Trim(DMMensagem.QMensagemDesc_Complemento7.Value);
         DMMensagem.QMensagem.Close;
       End;
       If Trim(FCaixaParam.Me9Mensagem1.Text) <> '' Then
       Begin
         DMMensagem.QMensagem.Close;
         DMMensagem.QMensagem.SetVariable('Pk',FCaixaParam.Me9Mensagem1.Text);
         DMMensagem.QMensagem.Open;
         FRFluxoCaixa.QRLMensagem5.Caption := FRFluxoCaixa.QRLMensagem5.Caption + ' '+Trim(DMMensagem.QMensagemDesc_Mensagem.Value);
         FRFluxoCaixa.QRLMensagem6.Caption := Trim(DMMensagem.QMensagemDesc_Complemento.Value) + ' '+Trim(DMMensagem.QMensagemDesc_Complemento1.Value);
         FRFluxoCaixa.QRLMensagem7.Caption := Trim(DMMensagem.QMensagemDesc_Complemento2.Value) + ' '+Trim(DMMensagem.QMensagemDesc_Complemento3.Value);
         FRFluxoCaixa.QRLMensagem8.Caption := Trim(DMMensagem.QMensagemDesc_Complemento4.Value) + ' '+Trim(DMMensagem.QMensagemDesc_Complemento5.Value);
         FRFluxoCaixa.QRLMensagem9.Caption := Trim(DMMensagem.QMensagemDesc_Complemento6.Value) + ' '+Trim(DMMensagem.QMensagemDesc_Complemento7.Value);
         DMMensagem.QMensagem.Close;
       End;
       If FCaixaParam.RGPreview.ItemIndex = 0 then
          FRFluxoCaixa.QRPrimario.Preview
       Else
          FRFluxoCaixa.QRPrimario.Print;
       QrFluxoCaixa.Close;
       QSaldoFluxoCaixa_Dt.Close;
     end;
  end;
end;

procedure TFFluxoCaixaSaldoCad.FluxoCaixaAnaltico1Click(Sender: TObject);
begin
  inherited;
  If FCaixaParam=Nil then
    FCaixaParam:=TFCaixaParam.Create(Application);
  FCaixaParam.PGRelatorio.Pages[11].TabVisible:=True;
  If FCaixaParam.ShowModal=MrOk then
  begin
    with DMFluxoCaixa do
     begin
       QRFluxoCaixaAnalit.Close;
       if Trim(FCaixaParam.ME11Filial.Text)<>'' then
          QRFluxoCaixaAnalit.SetVariable('FILIAL',StrToInt(Trim(FCaixaParam.ME11Filial.Text)))
       else
          QRFluxoCaixaAnalit.SetVariable('FILIAL',Null);
       if Trim(FCaixaParam.Me11Departamento.Text)<>'' then
         QRFluxoCaixaAnalit.SetVariable('DEPARTAMENTO',StrToInt(Trim(FCaixaParam.Me11Departamento.Text)))
       else
        QRFluxoCaixaAnalit.SetVariable('DEPARTAMENTO',Null);

       If ((FCaixaParam.ME11DtInicial.Text = '') or (FCaixaParam.ME11DtFinal.Text = '')) then
         Raise Exception.Create('A Data deve ser Informada');
       QRFluxoCaixaAnalit.SetVariable('DT_INICIAL',StrToDate(Trim(FCaixaParam.ME11DtInicial.Text)));
       QRFluxoCaixaAnalit.SetVariable('DT_FINAL',StrToDate(Trim(FCaixaParam.ME11DtFinal.Text)));
       If DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO' Then
         QRFluxoCaixaAnalit.SetVariable('PARAM_SUBSTITUICAO','TB_CONTA_RECEBER_CAB.COD_DEPARTAMENTO = 05')
       Else
         QRFluxoCaixaAnalit.SetVariable('PARAM_SUBSTITUICAO','TB_CONTA_RECEBER_CAB.IND_SITUACAO <> ' + Chr(39) +'BAIXA TOTAL' + Chr(39));
       QRFluxoCaixaAnalit.Open;

       If FRFluxoCaixaAnalitico = Nil then
          FRFluxoCaixaAnalitico:=TFRFluxoCaixaAnalitico.Create(Application);
       FRFluxoCaixaAnalitico.QRLFilial.Caption:='Filial:'+FCaixaParam.Ed11Filial.Text;
       FRFluxoCaixaAnalitico.QRLPeriodo.Caption:='Periodo:'+FCaixaParam.ME11DtInicial.Text+' até: '+FCaixaParam.ME11DtFinal.Text;
       FRFluxoCaixaAnalitico.QRLDepartamento.Caption:='Departamento:'+FCaixaParam.Ed11Departamento.Text;
       If FCaixaParam.RGPreview.ItemIndex = 0 then
          FRFluxoCaixaAnalitico.QRPrimario.Preview
       Else
          FRFluxoCaixaAnalitico.QRPrimario.Print;
       QRFluxoCaixaAnalit.Close;
    end;
   end;

end;

procedure TFFluxoCaixaSaldoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.dataset = nil then
    dsprimario.dataset := DMFluxoCaixa.QFluxoCaixaSaldo;
end;

procedure TFFluxoCaixaSaldoCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
