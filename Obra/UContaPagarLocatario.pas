unit UContaPagarLocatario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, StdCtrls, UFmFinalidade, UFmFilial, ActnList,
  ImgList, DB, Menus, ComCtrls, Mask, Buttons, ExtCtrls, UFmDatas,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFContaPagarLocatario = class(TFTCadSimples)
    FmFilial: TFmFilial;
    FmFinalidade: TFmFinalidade;
    GroupBox1: TGroupBox;
    MeMesReferencia: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FmDatas: TFmDatas;
    MeAnoReferencia: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContaPagarLocatario: TFContaPagarLocatario;

implementation

uses UImobiliaria_cl, UContasPagar_cl, UUsuario_cl, UOracle_cl;

{$R *.dfm}

procedure TFContaPagarLocatario.BitBtn1Click(Sender: TObject);
Var wDtReferencia, wDtVencimento : TDateTime;
begin
  inherited;
  If Trim(FmFilial.MeFilial.Text) = '' Then
     Raise Exception.Create('Informar Filial');
  If Trim(FmFinalidade.MeFinalidade.Text) = '' Then
     Raise Exception.Create('Informar Finalidade');
  If Trim(MeMesReferencia.Text) = '' Then
     Raise Exception.Create('Informar Mês Referência');
  If Trim(MeAnoReferencia.Text) = '' Then
     Raise Exception.Create('Informar Ano Referência');
  If Trim(FmDatas.MeDtInicial.Text) = '/  /' Then
     Raise Exception.Create('Informar Data Inicial');
  If Trim(FmDatas.MeDtFinal.Text) = '/  /' Then
     Raise Exception.Create('Informar Data Final');
  wDtReferencia := StrToDate('28/'+Trim(MeMesReferencia.Text)+'/'+Trim(MeAnoReferencia.Text));   // pega como referencia ultimo dia do mês
  With DmImobiliaria Do
   Begin
     QContaPagar_Locatario.Close;
     QContaPagar_Locatario.SetVariable('Cod_Filial',Trim(FmFilial.MeFilial.Text));
     QContaPagar_Locatario.SetVariable('Dt_Inicio',FmDatas.MeDtInicial.Text);
     QContaPagar_Locatario.SetVariable('Dt_Final',FmDatas.MeDtFinal.Text);
     QContaPagar_Locatario.SetVariable('Dt_Referencia',wDtReferencia);
     QContaPagar_Locatario.Open;
     Try
       While Not(QContaPagar_Locatario.Eof) Do
       Begin
         wDtVencimento := StrToDateTime(QContaPagar_LocatarioDia_Vencimento.Text +'/'+Trim(MeMesReferencia.Text)+'/'+Trim(MeAnoReferencia.Text));

         DMContasPagar.GeraContaPagar(QContaPagar_LocatarioCod_Proprietario.Value,
                                      StrToInt(Trim(FmFinalidade.MeFinalidade.Text)),
                                      0,
                                      QContaPagar_LocatarioCod_Filial.Value, 0,
                                      QContaPagar_LocatarioVal_Conta_Pagar.Value,
                                      IntToStr(DMUsuario.CodDepartamentoUsuario),
                                      'CON','Aluguel conforme contrato mês '+Trim(MeMesReferencia.Text) + ' de '+Trim(MeAnoReferencia.Text),
                                      '',wDtVencimento, Date, QContaPagar_LocatarioCod_Contrato_Locatario.Text);
         QContaPagar_Locatario.Next;
       End;
       DMOracle.DBCemapa.Commit;
       QContaPagar_Locatario.Close;
     Except
       DMOracle.DBCemapa.RollBack;
       Raise;
     End;
   End;
end;

procedure TFContaPagarLocatario.FormActivate(Sender: TObject);
begin
  inherited;
  FmFilial.MeFilial.Text := IntToStr(DmUsuario.CodFilialUsuario);
  FmFinalidade.MeFinalidade.Text := '10';

end;

end.
