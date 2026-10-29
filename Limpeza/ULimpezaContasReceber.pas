unit ULimpezaContasReceber;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, UFmDatas, UFmFilial, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFLimpezaContasReceber = class(TFTCadSimples)
    FmFilial: TFmFilial;
    FmDatas: TFmDatas;
    MeTipoDocumento: TMaskEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaContasReceber: TFLimpezaContasReceber;

implementation

uses ULimpeza_cl, UOracle_cl;

{$R *.dfm}

procedure TFLimpezaContasReceber.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If Trim(FmDatas.MeDtInicial.Text) = '' Then
     Raise Exception.Create('Preencher Data Inicial');

  If Trim(FmDatas.MeDtFinal.Text) = '' Then
     Raise Exception.Create('Preencher Data Final');
  With DMLimpeza do
  Begin
    QLimpeza_ContaReceberCab.Close;
    If Trim(FmFilial.MeFilial.Text) = '' Then
       QLimpeza_ContaReceberCab.SetVariable('Cod_Filial',Null)
    Else
       QLimpeza_ContaReceberCab.SetVariable('Cod_Filial',StrToInt(Trim(FmFilial.MeFilial.Text)));
    If Trim(MeTipoDocumento.Text) = '' Then
       QLimpeza_ContaReceberCab.SetVariable('Desc_Tipo_Documento',Null)
    Else
       QLimpeza_ContaReceberCab.SetVariable('Desc_Tipo_Documento',Trim(MeTipoDocumento.Text));
    QLimpeza_ContaReceberCab.SetVariable('Dt_Inicial',Trim(FmDatas.MeDtInicial.Text));
    QLimpeza_ContaReceberCab.SetVariable('Dt_Final',Trim(FmDatas.MeDtFinal.Text));

    QLimpeza_ContaReceberCab.Open;
    QLimpeza_Conta_Receber_Caixa_Cab.Open;
    QLimpeza_Conta_Receber_Banco_Cab.Open;
    QLimpeza_ContaReceberMov.Open;
    QLimpezaCaixa_Cr_Mov.Open;
    QLimpezaBanco_Cr_Mov.Open;
    QLimpezaCaixa_Banco_CR.Open;
    Try
      DMOracle.DBCemapa.StartTransaction;
      While not(QLimpeza_ContaReceberCab.Eof) Do
       Begin
         While not(QLimpeza_Conta_Receber_Caixa_Cab.Eof) Do
           QLimpeza_Conta_Receber_Caixa_Cab.Delete; //limpeza do caixa gerado pela inclusao de um titulo
         While not(QLimpeza_Conta_Receber_Banco_Cab.Eof) Do
           QLimpeza_Conta_Receber_Banco_Cab.Delete; //limpeza do banco gerado pela inclusao de um titulo
         While not(QLimpeza_ContaReceberMov.Eof) Do
          Begin
            While not(QLimpezaCaixa_Cr_Mov.Eof) Do
              QLimpezaCaixa_Cr_Mov.Delete; //limpeza do caixa gerado pela baixa de um titulo
            While not(QLimpezaBanco_Cr_Mov.Eof) Do
             Begin
               While not(QLimpezaCaixa_Banco_CR.Eof) Do
                 QLimpezaCaixa_Banco_CR.Delete; //limpeza do caixa gerado pela baixa de um titulo no banco
               QLimpezaBanco_Cr_Mov.Delete; //limpeza do banco gerado pela baixa de um titulo
             End;
            QLimpeza_ContaReceberMov.Delete; // limpeza dos movimentos do titulo
          End;
         QLimpeza_ContaReceberCab.Delete; // exclui o titulo
       End;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !!!!!');
    End;
    QLimpeza_ContaReceberCab.Close;
    QLimpeza_Conta_Receber_Caixa_Cab.Close;
    QLimpeza_Conta_Receber_Banco_Cab.Close;
    QLimpeza_ContaReceberMov.Close;
    QLimpezaCaixa_Cr_Mov.Close;
    QLimpezaBanco_Cr_Mov.Close;
    QLimpezaCaixa_Banco_CR.Close;

  End;

end;

end.
