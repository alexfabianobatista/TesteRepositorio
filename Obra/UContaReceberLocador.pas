unit UContaReceberLocador;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, UFmDatas, StdCtrls, Buttons, UFmFinalidade,
  UFmFilial, ActnList, ImgList, DB, Menus, ComCtrls, Mask, ExtCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFContaReceberLocador = class(TFTCadSimples)
    FmFilial: TFmFilial;
    FmFinalidade1: TFmFinalidade;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MeMesReferencia: TMaskEdit;
    MeAnoReferencia: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FmFinalidade2: TFmFinalidade;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaReceberLocador: TFContaReceberLocador;

implementation

uses UImobiliaria_cl, UContasReceber_cl, UUsuario_cl, UOracle_cl;

{$R *.dfm}

procedure TFContaReceberLocador.BitBtn1Click(Sender: TObject);
Var wDtReferencia, wDtVencimento : TDateTime;
begin
  inherited;
  If Trim(FmFilial.MeFilial.Text) = '' Then
     Raise Exception.Create('Informar Filial');
  If Trim(FmFinalidade1.MeFinalidade.Text) = '' Then
     Raise Exception.Create('Informar Finalidade para Aluguel');
  If Trim(FmFinalidade2.MeFinalidade.Text) = '' Then
     Raise Exception.Create('Informar Finalidade para Condominio');
  If Trim(MeMesReferencia.Text) = '' Then
     Raise Exception.Create('Informar Mês Referência');
  If Trim(MeAnoReferencia.Text) = '' Then
     Raise Exception.Create('Informar Ano Referência');
  wDtReferencia := StrToDate('28/'+Trim(MeMesReferencia.Text)+'/'+Trim(MeAnoReferencia.Text));  // pega como referencia ultimo dia do mês
  With DmImobiliaria Do
   Begin
     QContaReceber_Locador.Close;
     QContaReceber_Locador.SetVariable('Cod_Filial',Trim(FmFilial.MeFilial.Text));
     QContaReceber_Locador.SetVariable('Dt_Referencia',wDtReferencia);
     QContaReceber_Locador.Open;
     Try
       While Not(QContaReceber_Locador.Eof) Do
       Begin
         wDtVencimento := StrToDateTime(QContaReceber_LocadorDia_Vencimento.Text +'/'+Trim(MeMesReferencia.Text)+'/'+Trim(MeAnoReferencia.Text));

         DMContasReceber.IncluiCR(0,0,1,StrToInt(Trim(FmFinalidade1.MeFinalidade.Text)),DMUsuario.CodDepartamentoUsuario,0,
                  QContaReceber_LocadorCod_Cadastro.Value,QContaReceber_LocadorCod_Filial.Value,
                  QContaReceber_LocadorVl_Contrato.Value,'CON',wDtVencimento,Date,0,
                  'Aluguel conforme contrato mês '+Trim(MeMesReferencia.Text) + ' de '+Trim(MeAnoReferencia.Text),
                  QContaReceber_LocadorCod_Contrato_Locador.Text);
         If QContaReceber_LocadorVl_Condominio.Value > 0 Then
            DMContasReceber.IncluiCR(0,0,1,StrToInt(Trim(FmFinalidade2.MeFinalidade.Text)),DMUsuario.CodDepartamentoUsuario,0,
                  QContaReceber_LocadorCod_Cadastro.Value,QContaReceber_LocadorCod_Filial.Value,
                  QContaReceber_LocadorVl_Condominio.Value,'CON',wDtVencimento,Date,0,
                  'Condominio conforme contrato mês '+Trim(MeMesReferencia.Text) + ' de '+Trim(MeAnoReferencia.Text),
                  QContaReceber_LocadorCod_Contrato_Locador.Text);

         QContaReceber_Locador.Next;
       End;
       DMOracle.DBCemapa.Commit;
       QContaReceber_Locador.Close;
     Except
       DMOracle.DBCemapa.RollBack;
       Raise;
     End;
   End;
end;

procedure TFContaReceberLocador.FormActivate(Sender: TObject);
begin
  inherited;
  FmFilial.MeFilial.Text := IntToStr(DmUsuario.CodFilialUsuario);
  FmFinalidade1.MeFinalidade.Text := '8';
  FmFinalidade2.MeFinalidade.Text := '9';
end;

end.
