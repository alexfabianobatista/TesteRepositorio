unit UVoltaEtiquetaEmbarque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls;

type
  TFVoltaEtiquetaEmbarque = class(TForm)
    MEVoltaEtiqueta: TMaskEdit;
    EdVoltaEtiqueta: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure MEVoltaEtiquetaExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVoltaEtiquetaEmbarque: TFVoltaEtiquetaEmbarque;

implementation

uses UOracle_cl, UEmbarque_cl;

{$R *.dfm}

procedure TFVoltaEtiquetaEmbarque.FormActivate(Sender: TObject);
begin
  MEVoltaEtiqueta.SetFocus;
  Label1.Caption := '';
  Label2.Caption := '';
end;

procedure TFVoltaEtiquetaEmbarque.MEVoltaEtiquetaExit(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  Begin
    if MEVoltaEtiqueta.Text <> '' then
    EdVoltaEtiqueta.Text := DMOracle.BuscaNome('SELECT NOME_MOTORISTA FROM TB_EMBARQUE','COD_EMBARQUE =' + MEVoltaEtiqueta.Text);
  end
  Else
  Begin
    if MEVoltaEtiqueta.Text <> '' then
      EdVoltaEtiqueta.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO =' + copy(MEVoltaEtiqueta.Text,7,6));
  end;
end;

procedure TFVoltaEtiquetaEmbarque.Button1Click(Sender: TObject);
var
wEmbarque : string;
wVol, wCont : integer;
begin
  wEmbarque := DMOracle.BuscaNome('SELECT IND_TURNO FROM TB_ESTOQUE_PRODUCAO','NUM_CONTROLE ='+ Copy(MEVoltaEtiqueta.Text,1,6));

  if RadioGroup1.ItemIndex = 1 then //voltar 1 produto por vez
  Begin
    If wEmbarque = 'N' then
    Begin
      DMOracle.DBCemapa.StartTransaction;
      Try
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE_PRODUCAO SET NUM_LINHA = 1');
        DMOracle.QExecSQL.SQL.Add(' WHERE NUM_CONTROLE = '+ Copy(MEVoltaEtiqueta.Text,1,6));
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        MEVoltaEtiqueta.SetFocus;

      Except
        DMOracle.DBCemapa.Rollback;
        Raise Exception.Create('Este produto já foi carregado!');
      End;
    End;
  end
  else
  if RadioGroup1.ItemIndex = 0 then //volta todas as etiquetas do embarque
  Begin
    DMEmbarque.QVoltaEtiquetaEmbarque.Close;
    DMEmbarque.QVoltaEtiquetaEmbarque.SetVariable('EMBARQUE', MEVoltaEtiqueta.Text);
    DMEmbarque.QVoltaEtiquetaEmbarque.Open;
    DMEmbarque.QVoltaEtiquetaEmbarque.First;
    While not DMEmbarque.QVoltaEtiquetaEmbarque.EOF do
    Begin
      DMOracle.DBCemapa.StartTransaction;
      Try
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE_PRODUCAO SET NUM_LINHA = 1');
        DMOracle.QExecSQL.SQL.Add(' WHERE COD_ESTOQUE_PRODUCAO = '+ DMEmbarque.QVoltaEtiquetaEmbarqueCOD_ESTOQUE_PRODUCAO.Text);
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.DBCemapa.Commit;
        DMEmbarque.QVoltaEtiquetaEmbarque.Next;
      Except
        DMOracle.DBCemapa.Rollback;
        Raise Exception.Create('Este produto já foi carregado!');
      End;
    end;
  end;
  showmessage('Volta das Etiquetas do realizada com sucesso!');
  FVoltaEtiquetaEmbarque.Close;
end;

procedure TFVoltaEtiquetaEmbarque.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0 then
  Begin
    Label1.caption := 'Cód. Embarque';
    Label2.Caption := 'Descrição';
    EdVoltaEtiqueta.Text := 'Digite o Código do Embarque!';
  end
  else
  Begin
    Label1.Caption := 'Etiqueta';
    Label2.Caption := 'Produto';
    EdVoltaEtiqueta.Text := 'Informe a Etiqueta do Produto!';
  end;
end;

end.
