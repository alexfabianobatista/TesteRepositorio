unit ULimpezaContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, UFmDatas, UFmFilial;

type
  TFLimpezaContasPagar = class(TFTCadSimples)
    Label1: TLabel;
    FmFilial: TFmFilial;
    FmDatas: TFmDatas;
    MeTipoDocumento: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaContasPagar: TFLimpezaContasPagar;

implementation

uses ULimpeza_cl, UOracle_cl;

{$R *.dfm}

procedure TFLimpezaContasPagar.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If Trim(FmDatas.MeDtInicial.Text) = '' Then
     Raise Exception.Create('Preencher Data Inicial');

  If Trim(FmDatas.MeDtFinal.Text) = '' Then
     Raise Exception.Create('Preencher Data Final');
  With DMLimpeza do
  Begin
    QLimpeza_ContaPagarCab.Close;
    If Trim(FmFilial.MeFilial.Text) = '' Then
       QLimpeza_ContaPagarCab.SetVariable('Cod_Filial',Null)
    Else
       QLimpeza_ContaPagarCab.SetVariable('Cod_Filial',StrToInt(Trim(FmFilial.MeFilial.Text)));
    If Trim(MeTipoDocumento.Text) = '' Then
       QLimpeza_ContaPagarCab.SetVariable('Desc_Tipo_Documento',Null)
    Else
       QLimpeza_ContaPagarCab.SetVariable('Desc_Tipo_Documento',Trim(MeTipoDocumento.Text));
    QLimpeza_ContaPagarCab.SetVariable('Dt_Inicial',Trim(FmDatas.MeDtInicial.Text));
    QLimpeza_ContaPagarCab.SetVariable('Dt_Final',Trim(FmDatas.MeDtFinal.Text));

    QLimpeza_ContaPagarCab.Open;
    QLimpeza_Conta_Pagar_Caixa_Cab.Open;
    QLimpeza_Conta_Pagar_Banco_Cab.Open;
    QLimpeza_ContaPagarMov.Open;
    QLimpezaCaixa_Cp_Mov.Open;
    QLimpezaBanco_Cp_Mov.Open;
    QLimpezaCaixa_Banco_CP.Open;
    Try
      DMOracle.DBCemapa.StartTransaction;
      While not(QLimpeza_ContaPagarCab.Eof) Do
       Begin
         While not(QLimpeza_Conta_Pagar_Caixa_Cab.Eof) Do
           QLimpeza_Conta_Pagar_Caixa_Cab.Delete; //limpeza do caixa gerado pela inclusao de um titulo
         While not(QLimpeza_Conta_Pagar_Banco_Cab.Eof) Do
           QLimpeza_Conta_Pagar_Banco_Cab.Delete; //limpeza do banco gerado pela inclusao de um titulo
         While not(QLimpeza_ContaPagarMov.Eof) Do
          Begin
            While not(QLimpezaCaixa_Cp_Mov.Eof) Do
              QLimpezaCaixa_Cp_Mov.Delete; //limpeza do caixa gerado pela baixa de um titulo
            While not(QLimpezaBanco_Cp_Mov.Eof) Do
             Begin
               While not(QLimpezaCaixa_Banco_CP.Eof) Do
                 QLimpezaCaixa_Banco_CP.Delete; //limpeza do caixa gerado pela baixa de um titulo no banco
               QLimpezaBanco_Cp_Mov.Delete; //limpeza do banco gerado pela baixa de um titulo
             End;
            QLimpeza_ContaPagarMov.Delete; // limpeza dos movimentos do titulo
          End;
         QLimpeza_ContaPagarCab.Delete; // exclui o titulo
       End;
      DMOracle.DBCemapa.Commit;
      ShowMessage('Limpeza Efetuada com Sucesso');
    Except
      DMOracle.DBCemapa.RollBack;
      ShowMessage('Limpeza não efetuada !!!!!');
    End;
    QLimpeza_ContaPagarCab.Close;
    QLimpeza_Conta_Pagar_Caixa_Cab.Close;
    QLimpeza_Conta_Pagar_Banco_Cab.Close;
    QLimpeza_ContaPagarMov.Close;
    QLimpezaCaixa_Cp_Mov.Close;
    QLimpezaBanco_Cp_Mov.Close;
    QLimpezaCaixa_Banco_CP.Close;
  End;
end;

end.
