unit UArquivoSinco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls;

type
  TFArquivoSinco = class(TFTCadSimples)
    Opo1: TMenuItem;
    LancamentoDiarioGeral1: TMenuItem;
    SaldosMensaisDiarioGeral1: TMenuItem;
    PlanoDeContas1: TMenuItem;
    procedure LancamentoDiarioGeral1Click(Sender: TObject);
    procedure PlanoDeContas1Click(Sender: TObject);
    procedure SaldosMensaisDiarioGeral1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FArquivoSinco: TFArquivoSinco;

implementation

uses URegINSS, URegINSS_cl, uBiblioteca;

{$R *.dfm}

procedure TFArquivoSinco.LancamentoDiarioGeral1Click(Sender: TObject);
Var s,s1,wEspacos : String;
    F : TextFile;
begin
  inherited;
  If FRegINSSParam = Nil Then
    FRegINSSParam := TFRegINSSParam.Create(Application);
  FRegINSSParam.Rg1ArquivoGerar.Visible := False;
  FRegINSSParam.PGRelatorio.Pages[1].TabVisible := True;
  if FRegINSSParam.ShowModal = mrok then
   with DMRegINSS do
   begin
     QRegContabil.Close;
     If Trim(FRegINSSParam.FMFilial1Inicial.MeFilial.Text) = '' Then
       QRegContabil.SetVariable('COD_FILIAL_INICIAL',Null)
     Else
       QRegContabil.SetVariable('COD_FILIAL_INICIAL',FRegINSSParam.FMFilial1Inicial.MEFilial.Text);
     If Trim(FRegINSSParam.FMFilial1Final.MeFilial.Text) = '' Then
       QRegContabil.SetVariable('COD_FILIAL_FINAL',Null)
     Else
       QRegContabil.SetVariable('COD_FILIAL_FINAL',FRegINSSParam.FMFilial1Final.MEFilial.Text);
     QRegContabil.SetVariable('DT_INICIAL',FRegINSSParam.FmDatas1.MeDtInicial.Text);
     QRegContabil.SetVariable('DT_FINAL',FRegINSSParam.FmDatas1.MeDtFinal.Text);
     QRegContabil.Open;
    End;

  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegContabil.eof do
  begin
      s1 := FormatDateTime('DDMMYYYY',DMRegINSS.QRegContabilDt_Lancamento.Value);
      s1 := s1 + Bib.AjustaStr(DMRegINSS.QRegContabilNum_Plano_Conta.Text,28);
      s1 := s1 + Bib.AjustaStr(wEspacos,28);
      s1 := s1 + Bib.AjustaStr(DMRegINSS.QRegContabilNum_Contrapartida.Text,28);
      If DMRegINSS.QRegContabilVal_Lancamento.Value < 0 Then
         s1 := s1 + bib.StrZeroDecimal(DMRegINSS.QRegContabilVal_Lancamento.Value * -1,17,2)
      Else
         s1 := s1 + bib.StrZeroDecimal(DMRegINSS.QRegContabilVal_Lancamento.Value,17,2);
      s1 := s1 + DMRegINSS.QRegContabilInd_Operacao.Value;
      s1 := s1 + Bib.AjustaStr(wEspacos,12);
      s1 := s1 + Bib.AjustaStr(wEspacos,12);
      s1 := s1 + Bib.AjustaStr(DMRegINSS.QRegContabilDesc_Historico_Contabil.Value,150) + chr(13)+chr(10);
      s := s + s1;
      DMRegINSS.QRegContabil.Next;
  end;

  If FRegINSSParam.SDlgAMagnetico.Execute then
   begin
     AssignFile( F, FRegINSSParam.SDlgAMagnetico.FileName );
     Rewrite(F);
     Writeln(F, S);
     CloseFile(F);
     MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
   end
  else
     MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);


end;

procedure TFArquivoSinco.PlanoDeContas1Click(Sender: TObject);
Var s,wEspacos : String;
    F : TextFile;
begin
  inherited;
  If FRegINSSParam = Nil Then
    FRegINSSParam := TFRegINSSParam.Create(Application);
  FRegINSSParam.Rg1ArquivoGerar.Visible := False;
  FRegINSSParam.PGRelatorio.Pages[1].TabVisible := True;
  if FRegINSSParam.ShowModal = mrok then
  with DMRegINSS do
  begin
    QRegPlanoContas.Close;
    QRegPlanoContas.Open;
    QRegPlanoContas.First;
  End;

  s := '';
  wEspacos := ' ';
  while not DMRegINSS.QRegPlanoContas.eof do
  begin
      s := s + FormatDateTime('DDMMYYYY',Date);
      s := s + Bib.AjustaStr(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text,28);
      s := s + DMRegINSS.QRegPlanoContasInd_Tipo_Conta.Text;
      If DMRegINSS.QRegPlanoContasInd_Tipo_Conta.Text = 'A' Then
         s := s + Bib.AjustaStr(Copy(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text,1,Length(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text) - 6),28)
      Else
         If Length(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text) = 1 Then
            s := s + Bib.AjustaStr(wEspacos,28)
         Else
            s := s + Bib.AjustaStr(Copy(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text,1,Length(DMRegINSS.QRegPlanoContasNum_Plano_Conta.Text) - 2),28);
      s := s + Bib.AjustaStr(DMRegINSS.QRegPlanoContasDesc_Plano_Conta.Text,45);
      s := s + chr(13)+chr(10);
      DMRegINSS.QRegPlanoContas.Next;
  end;
  If FRegINSSParam.SDlgAMagnetico.Execute then
   begin
     AssignFile( F, FRegINSSParam.SDlgAMagnetico.FileName );
     Rewrite(F);
     Writeln(F, S);
     CloseFile(F);
     MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
   end
  else
     MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);

end;

procedure TFArquivoSinco.SaldosMensaisDiarioGeral1Click(Sender: TObject);
Var s, a : String;
    F : TextFile;
begin
  inherited;
  If FRegINSSParam = Nil Then
    FRegINSSParam := TFRegINSSParam.Create(Application);
  FRegINSSParam.Rg1ArquivoGerar.Visible := False;
  FRegINSSParam.PGRelatorio.Pages[1].TabVisible := True;
  if FRegINSSParam.ShowModal = mrok then
   With DMRegINSS Do
   Begin
     QRegSaldoContabil.Close;
     If Trim(FRegINSSParam.FMFilial1Inicial.MeFilial.Text) = '' Then
       QRegSaldoContabil.SetVariable('COD_FILIAL_INICIAL',Null)
     Else
       QRegSaldoContabil.SetVariable('COD_FILIAL_INICIAL',FRegINSSParam.FMFilial1Inicial.MEFilial.Text);
     If Trim(FRegINSSParam.FMFilial1Final.MeFilial.Text) = '' Then
       QRegSaldoContabil.SetVariable('COD_FILIAL_FINAL',Null)
     Else
       QRegSaldoContabil.SetVariable('COD_FILIAL_FINAL',FRegINSSParam.FMFilial1Final.MEFilial.Text);
     QRegSaldoContabil.SetVariable('DT_ANO_MES_INICIAL',Copy(FRegINSSParam.FmDatas1.MeDtInicial.Text,7,4)+Copy(FRegINSSParam.FmDatas1.MeDtInicial.Text,4,2));
     QRegSaldoContabil.SetVariable('DT_ANO_MES_FINAL',Copy(FRegINSSParam.FmDatas1.MeDtFinal.Text,7,4)+Copy(FRegINSSParam.FmDatas1.MeDtFinal.Text,4,2));
     QRegSaldoContabil.Open;
   End;
   s := '';
   a := '';
  While not DMRegINSS.QRegSaldoContabil.eof do
  Begin
      s := '01'+Copy(DMRegINSS.QRegSaldoContabilDt_Ano_Mes.Text,5,2)+Copy(DMRegINSS.QRegSaldoContabilDt_Ano_Mes.Text,1,4);
      s := s + Bib.AjustaStr(DMRegINSS.QRegSaldoContabilNum_Plano_Conta.Text,28);
      If DMRegINSS.QRegSaldoContabilVal_Anterior.Value < 0 Then
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Anterior.Value * -1,17,2)+'C'
      Else
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Anterior.Value,17,2)+'D';
      If DMRegINSS.QRegSaldoContabilVal_Debito.Value < 0 Then
        s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Debito.Value * -1,17,2)
      Else
        s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Debito.Value,17,2);
      If DMRegINSS.QRegSaldoContabilVal_Credito.Value < 0 Then
        s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Credito.Value * -1,17,2)
      Else
        s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Credito.Value,17,2);
      If DMRegINSS.QRegSaldoContabilVal_Atual.Value < 0 Then
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Atual.Value * -1,17,2)+'C'
      Else
         s := s + bib.StrZeroDecimal(DMRegINSS.QRegSaldoContabilVal_Atual.Value,17,2)+'D';
      a := a + s + chr(13)+chr(10);
      DMRegINSS.QRegSaldoContabil.Next;
  End;
  If FRegINSSParam.SDlgAMagnetico.Execute then
   begin
     AssignFile( F, FRegINSSParam.SDlgAMagnetico.FileName );
     Rewrite(F);
     Writeln(F, a);
     CloseFile(F);
     MessageDlg('Arquivo Gerado com Sucesso!', mtInformation,[mbOk], 0);
   end
  else
     MessageDlg('Arquivo não foi Gerado!', mtWarning,[mbOk], 0);

end;

end.
