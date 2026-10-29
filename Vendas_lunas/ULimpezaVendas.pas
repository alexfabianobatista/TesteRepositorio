unit ULimpezaVendas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls;

type
  TFLimpezaVendas = class(TForm)
    MECodFilial: TMaskEdit;
    Label90: TLabel;
    BitBtn3: TBitBtn;
    MEFilial: TMaskEdit;
    MEData: TMaskEdit;
    Label88: TLabel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    PBLimpeza: TProgressBar;
    RGPagamento: TRadioGroup;
    procedure MECodFilialExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLimpezaVendas: TFLimpezaVendas;

implementation

uses UFilial_cl, UFilialCons, UOracle_cl, UNotaSaida_cl, ULimpeza_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFLimpezaVendas.MECodFilialExit(Sender: TObject);
begin
  If Trim(MECodFilial.Text) <> '' Then
  With DMFilial do
  Begin
    QFilial.Close;
    QFilial.SetVariable('PK',MECodFilial.Text);
    QFilial.Open;
    MEFilial.Text := QFilialDesc_Filial.Value;
  End
  Else
    MEFilial.Text := 'Todos';
 
end;

procedure TFLimpezaVendas.BitBtn3Click(Sender: TObject);
begin
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    MECodFilial.Text := DMFilial.QFilialConsCod_Filial.Text;
    MECodFilialExit(Self);
  End;

end;

procedure TFLimpezaVendas.SpeedButton1Click(Sender: TObject);
Var WPagto : String;
begin
  DmUsuario.Checar_Filial_Usuario( Trim(MeCodFilial.Text),'VENDA');
  PBLimpeza.Max := 4;
  With  DMLimpeza Do
  Begin
    DMOracle.DBCEmapa.StartTransaction;
    Try
      If  RGPagamento.ItemIndex =  0 Then
      Begin
        wPagto := '1';
        QLimpaCaixa.Close;
        QLimpaCaixa.SetVariable('FILIAL',Trim(MeCodFilial.Text));
        QLimpaCaixa.SetVariable('DATA_REFER',StrToDate(MeData.Text));
        QLimpaCaixa.ExecSql;
      End;
      If  RGPagamento.ItemIndex =  1 Then
      Begin
        wPagto := '2';
        QLimpaPrazo.Close;
        QLimpaPrazo.SetVariable('FILIAL',Trim(MeCodFilial.Text));
        QLimpaPrazo.SetVariable('DATA_REFER',StrToDate(MeData.Text));
        QLimpaPrazo.ExecSql;
      End;
      If  RGPagamento.ItemIndex =  2 Then
      Begin
        wPagto := '3';
        QLimpaConta.Close;
        QLimpaConta.SetVariable('FILIAL',Trim(MeCodFilial.Text));
        QLimpaConta.SetVariable('DATA_REFER',StrToDate(MeData.Text));
        QLimpaConta.ExecSql;
      End;
      DMOracle.DBCemapa.Commit;
      PBLimpeza.Position := 1;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    end;
    // limpeza BAIXA PEDIDOS de nota fiscal a vista
    DMOracle.DBCEmapa.StartTransaction;
    Try
      QLimpaPedido.Close;
      QLimpaPedido.SetVariable('FILIAL',Trim(MeCodFilial.Text));
      QLimpaPedido.SetVariable('DATA_REFER',StrToDate(MeData.Text));
      QLimpaPedido.ExecSql;
      DMOracle.DBCemapa.Commit;
      PBLimpeza.Position := 2;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    end;
    // limpeza dos itens de nota fiscal a vista
    DMOracle.DBCEmapa.StartTransaction;
    Try
      QLimpaNotaItem.Close;
      QLimpaNotaItem.SetVariable('FILIAL',Trim(MeCodFilial.Text));
      QLimpaNotaItem.SetVariable('DATA_REFER',StrToDate(MeData.Text));
      QLimpaNotaItem.SetVariable('CONDICAO_PAGTO',wPagto);
      QLimpaNotaItem.ExecSql;
      DMOracle.DBCemapa.Commit;
      PBLimpeza.Position := 3;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    end;
      // limpeza dos itens de nota fiscal a vista
    DMOracle.DBCEmapa.StartTransaction;
    Try
      QLimpaNotaCab.Close;
      QLimpaNotaCab.ExecSql;
      DMOracle.DBCemapa.Commit;
      PBLimpeza.Position := 4;
    Except
      DMOracle.DBCemapa.RollBack;
      Raise;
    end;
  End;
  MessageDlg('Limpeza Efetuada Com Sucesso', mtInformation,[mbOk], 0);
  PBLimpeza.Position := 0;
end;

procedure TFLimpezaVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := CaFree;
  FLimpezaVendas := Nil;
end;

end.
