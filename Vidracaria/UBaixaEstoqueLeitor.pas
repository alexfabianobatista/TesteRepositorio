unit UBaixaEstoqueLeitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, variants, Grids, DBGrids;

type
  TFBaixaEstoqueLeitor = class(TForm)
    Panel1: TPanel;
    MEEmbarque: TMaskEdit;
    EdEmbarque: TEdit;
    EdProduto: TEdit;
    MEProduto: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    MENum_Nota: TMaskEdit;
    EdNum_Nota: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    SBProdEmbarcado: TSpeedButton;
    MeQtPedido: TMaskEdit;
    MePeso: TMaskEdit;
    DBGrid1: TDBGrid;
    MeVolumes: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    MeEmbarcado: TMaskEdit;
    Label9: TLabel;
    procedure MEEmbarqueExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  
   // procedure EdSerieExit(Sender: TObject);
    procedure MENum_NotaExit(Sender: TObject);
    procedure SBProdEmbarcadoClick(Sender: TObject);
    procedure MEProdutoChange(Sender: TObject);
    procedure MeVolumesExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FBaixaEstoqueLeitor: TFBaixaEstoqueLeitor;
  Wnum_controle, wPeso: string;

implementation

uses UEmbarque_cl, UOracle_cl, UEstoque_cl, URBaixaEstoqueLeitor,
  UrEmbarquePedido, UNotaSaida_cl, UEmbarqueParam, URProdutoEmbarcado2;

{$R *.DFM}

function ReplaceStr(Sstring: string; OldChar, NewChar: char): string;
//
// Substitui um carctere por outro em uma string
//
var
Temp: string;
I: integer;
begin
Temp := '';
for I := 1 to Length (Sstring) do
    begin
    if Sstring[I] <> OldChar then
       begin
       Temp := Temp + Sstring[I];
       end
    else
       begin
       Temp := Temp + NewChar;
       end;
    end;
Result := Temp;
end;

procedure TFBaixaEstoqueLeitor.MEEmbarqueExit(Sender: TObject);
begin
  If Trim(MeEmbarque.Text) <> '' then
  With DMEmbarque do
   Begin
    QEmbarque.Close;
    QEmbarque.SetVariable('PK',Trim(MeEmbarque.Text));
    QEmbarque.Open;
    EdEmbarque.Text := QEmbarqueNome_Motorista.Value+' = '+QEmbarqueDt_Embarque.Text;
    QEmbarque.Close;
    //MEProduto.SetFocus;
   End;

end;

procedure TFBaixaEstoqueLeitor.BitBtn1Click(Sender: TObject);
var  wAux, wCont1, wSeq : String;
     wCont : Integer;
     wCaixas, wVol : Real;
begin
  if (Trim(MeEmbarque.Text) = '') or (trim(MeNum_Nota.Text) = '')then
    Raise Exception.Create('Informe o Embarque e o Número do Pedido!');

  With DMEmbarque do
    try
      DMOracle.DBCemapa.StartTransaction;
      If ((MEProduto.Text) <> '') and ((wNum_controle) <> '') then
      Begin
        wAux := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PESAGEM_PRODUCAO','COD_PESAGEM = '+wNum_Controle);
        wCont1 := copy(wPeso,1,2) + ',' + copy(wPeso,3,2);
        If wAux = 'CONFIRMADO' then
        Begin
          QBaixaEstoqueLeitor.close;
          QBaixaEstoqueLeitor.SetVariable('EMBARQUE',Trim(FBaixaEstoqueLeitor.MEEmbarque.Text));
          QBaixaEstoqueLeitor.SetVariable('COD_PEDIDO',Trim(FBaixaEstoqueLeitor.MENum_Nota.Text));
          QBaixaEstoqueLeitor.SetVariable('PRODUTO',Trim(FBaixaEstoqueLeitor.MEProduto.Text));
          QBaixaEstoqueLeitor.open;
          MeQtPedido.Text := QBaixaEstoqueLeitorQT_PEDIDO.Text;
          MePeso.Text := wCont1;

          if Trim(QBaixaEstoqueLeitorCod_Pedido_Item.Text) <> '' then
          Begin
            DMOracle.QExecSQL.Close;
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET QT_QUANTIDADE_AUX = '+CHR(39)+FloatToStr(QBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Value + StrToFloat(wCont1))+CHR(39));
            DMOracle.QExecSQL.SQL.Add('WHERE COD_PEDIDO_ITEM = ' + QBaixaEstoqueLeitorCod_Pedido_Item.Text);
            DMOracle.QExecSQL.ExecSQL;
            DMOracle.DBCemapa.Commit;

            DMOracle.QExecSQL.Close;
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET QT_EMBALAGEM = '+CHR(39)+FloatToStr(QBaixaEstoqueLeitorQT_EMBALAGEM.Value + 1)+CHR(39));
            DMOracle.QExecSQL.SQL.Add('WHERE COD_PEDIDO_ITEM = ' + QBaixaEstoqueLeitorCod_Pedido_Item.Text);
            DMOracle.QExecSQL.ExecSQL;
            DMOracle.DBCemapa.Commit;

            DMOracle.QExecSQL.Close;
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_PESAGEM_PRODUCAO SET IND_SITUACAO = '+CHR(39)+'EMBARCADO'+CHR(39));
            DMOracle.QExecSQL.SQL.Add('WHERE COD_PESAGEM = ' + wNum_Controle);
            DMOracle.QExecSQL.ExecSQL;
            DMOracle.DBCemapa.Commit;

            wSeq := DMOracle.BuscaNome('SELECT SQESTOQUE_EMBARCADO.NEXTVAL FROM DUAL','1=1');
            DMOracle.QExecSQL.Close;
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_ESTOQUE_EMBARCADO(COD_ESTOQUE_EMBARCADO,COD_PRODUTO,COD_FILIAL,'+
                                      'COD_EMBARQUE,QT_EMBARCADO,QT_PESO_EMBARCADO,NUM_CONTROLE,DT_EMBARQUE,         '+
                                      'COD_PEDIDO_CAB) VALUES('+wSeq+','+Trim(MEProduto.Text)+','+ '1,'               +
                                      Trim(MeEmbarque.Text)+','+'1,'+wCont1+','+wNum_Controle+','                     +
                                      chr(39)+DateToStr(DATE)+chr(39)+','+FBaixaEstoqueLeitor.MENum_Nota.Text+')'); 
            DMOracle.QExecSQL.ExecSQL;

            {QEstoqueEmbarcado.Close;
            QEstoqueEmbarcado.Open;
            QEstoqueEmbarcado.Insert;
            QEstoqueEmbarcadoCOD_PRODUTO.Value := StrToInt(MEProduto.Text);
            QEstoqueEmbarcadoCOD_FILIAL.Value := 1;
            QEstoqueEmbarcadoCOD_EMBARQUE.Value := StrToInt(Trim(MeEmbarque.Text));
            QEstoqueEmbarcadoQT_EMBARCADO.Value := 1;
            QEstoqueEmbarcadoQT_PESO_EMBARCADO.Value := StrToFloat(wCont1);
            QEstoqueEmbarcadoNUM_CONTROLE.Value := StrToInt(WNum_Controle);
            QEstoqueEmbarcadoDT_EMBARQUE.Value := date;
            QEstoqueEmbarcadoCOD_PEDIDO_CAB.Value := StrToInt(Trim(FBaixaEstoqueLeitor.MENum_Nota.Text));
            QEstoqueEmbarcado.Post;
            QEstoqueEmbarcado.CommitUpdates; }

            MeVolumes.Text := QBaixaEstoqueLeitorQT_EMBALAGEM.Text;

            DMOracle.DBCemapa.Commit;
          end;                //DMEstoque.AtualizaEstoque(-2,1,StrToInt(MEProduto.Text),18,-1,0,0,0);
        end
        else
        Begin
          MEProduto.Text := '';
          if (wAux = 'CANCELADA') then
            Raise Exception.Create('Etiqueta Cancelada!');
          if (wAux = 'EMBARCADO') then
            Raise Exception.Create('Produto Embarcado');
        end;
      end;  
      //DMOracle.DBCemapa.Commit;

        DMEmbarque.QRBaixaEstoqueLeitor.Close;
        DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('EMBARQUE',MeEmbarque.Text);
        DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('COD_PEDIDO',MeNum_Nota.Text);
        DMEmbarque.QRBaixaEstoqueLeitor.open;
        QBaixaEstoqueLeitor.close;
        //MeVolumes.Text := DMEmbarque.QRBaixaEstoqueLeitorQT_EMBALAGEM.Text;
        MeEmbarcado.Text := DMOracle.BuscaNome('SELECT QT_QUANTIDADE_AUX FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB='+ MeNum_Nota.Text+
                                               ' and COD_PRODUTO ='+MeProduto.Text);
        MeQtPedido.Text := DMOracle.BuscaNome('SELECT QT_PEDIDO FROM TB_PEDIDO_ITEM','COD_PEDIDO_CAB='+ MeNum_Nota.Text+
                                               ' and COD_PRODUTO ='+MeProduto.Text);
        EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO','COD_PRODUTO ='+MeProduto.Text);

        MeProduto.Text := '';
        MEProduto.SetFocus;  
    except
      DMOracle.DBCemapa.rollback;
    Raise;
    end;
   MeProduto.Text := '';
end;

procedure TFBaixaEstoqueLeitor.MEProdutoExit(Sender: TObject);
begin
  if ((Trim(MEProduto.Text) <> '') and (Length(MeProduto.Text) = 14)) then
  Begin
    FBaixaEstoqueLeitor.EdProduto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = '+Copy(MEProduto.Text,7,3));
    wNum_Controle := Copy(MEProduto.Text,1,7);
    wPeso := copy(MEProduto.Text,11,4);
    MEProduto.Text := Copy(MEProduto.Text,8,3); 
    BitBtn1Click(Self);
  end;
end;

procedure TFBaixaEstoqueLeitor.SpeedButton1Click(Sender: TObject);
begin
  if (Trim(MEEmbarque.Text) = '')  then
    Raise Exception.Create('Informe o Embarque!');
  With DMEmbarque do
    Begin
      QRBaixaEstoqueLeitor.Close;
      QRBaixaEstoqueLeitor.SetVariable('EMBARQUE',Trim(MeEmbarque.Text));
      if Trim(MeNum_Nota.Text) = '' then
        QRBaixaEstoqueLeitor.SetVariable('NUM_NOTA',NULL)
      Else
        QRBaixaEstoqueLeitor.SetVariable('NUM_NOTA',Trim(MENum_Nota.Text));
      QRBaixaEstoqueLeitor.Open;
      If FrBaixaEstoqueLeitor = Nil then
        FrBaixaEstoqueLeitor := TFrBaixaEstoqueLeitor.Create(Application);
      FrBaixaEstoqueLeitor.QRLEmbarque.Caption:='Embarque: '+ (MEEmbarque.Text)+ 'Motorista: ' +(EdEmbarque.Text);
      FrBaixaEstoqueLeitor.QRPrimario.Preview;
      QRBaixaEstoqueLeitor.Close;
    End;
end;

procedure TFBaixaEstoqueLeitor.MENum_NotaExit(Sender: TObject);
var
wEmbarque : integer;
wCadastro : integer;
begin
  if Trim(MeEmbarque.Text) <> '' then
  Begin
    wEmbarque := StrToInt(DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM ','COD_PEDIDO_CAB ='+ MeNum_nota.Text));
    wCadastro := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB','COD_PEDIDO_CAB ='+MeNum_Nota.Text));
    if IntToStr(wEmbarque) <> Trim(MEEmbarque.Text) then
      Raise Exception.Create('Pedido não pertence a este embarque!')
    else
    Begin
      DMEmbarque.QRBaixaEstoqueLeitor.Close;
      DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('EMBARQUE',MeEmbarque.Text);
      DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('COD_PEDIDO',MeNum_Nota.Text);
      DMEmbarque.QRBaixaEstoqueLeitor.open;
      EdNum_Nota.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO ='+IntToStr(wCadastro));
      MeProduto.SetFocus;
    end;
  end;
end;

procedure TFBaixaEstoqueLeitor.SBProdEmbarcadoClick(Sender: TObject);
begin
  If FEmbarqueParam = Nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[13].TabVisible := True;
  If FEmbarqueParam.ShowModal = mrOk then
  With DMEmbarque do
  Begin
    QRProdutoEmbarcado2.Close;
    If (FEmbarqueParam.Me14DtInicial.Text = '') or (FEmbarqueParam.Me14DtFinal.Text = '')  Then
    Begin
      QRProdutoEmbarcado2.SetVariable('DT_INICIAL',Null);
      QRProdutoEmbarcado2.SetVariable('DT_FINAL',Null);
    end
    else
    Begin
      QRProdutoEmbarcado2.SetVariable('DT_INICIAL',trim(FEmbarqueParam.Me14DtInicial.Text));
      QRProdutoEmbarcado2.SetVariable('DT_FINAL',trim(FEmbarqueParam.Me14DtFinal.Text));
    end;

    If (FEmbarqueParam.Me14Embarque.Text = '') then
      QRProdutoEmbarcado2.SetVariable('EMBARQUE',Null)
    Else
      QRProdutoEmbarcado2.SetVariable('EMBARQUE',trim(FEmbarqueParam.Me14Embarque.Text));

    If (Trim(FEmbarqueParam.Me14Classe.Text) = '') then
      QRProdutoEmbarcado2.SetVariable('CLASSE',Null)
    Else
      QRProdutoEmbarcado2.SetVariable('CLASSE',trim(FEmbarqueParam.Me14Classe.Text));
      
    QRProdutoEmbarcado2.Open;
    If FrProdutoEmbarcado2 = Nil then
      FrProdutoEmbarcado2 := TFrProdutoEmbarcado2.Create(Application);
    FrProdutoEmbarcado2.QRLPeriodo.Caption := 'Período: '+FEmbarqueParam.ME14DtInicial.text + ' até '+FEmbarqueParam.ME14DtFinal.Text+
                                              'Embarque: '+ FEmbarqueParam.ME14Embarque.Text + ' Classe: '+ FEmbarqueParam.ME14Classe.Text;
    If FEmbarqueParam.RGPreview.ItemIndex = 0 then
      FrProdutoEmbarcado2.QRPrimario.Preview
    Else
      FrProdutoEmbarcado2.QRPrimario.Print;
    QRProdutoEmbarcado2.Close;
  End;
end;

procedure TFBaixaEstoqueLeitor.MEProdutoChange(Sender: TObject);
begin
  if Length(MEProduto.Text) = 14 then
    MeProdutoExit(Self);   
end;

procedure TFBaixaEstoqueLeitor.MeVolumesExit(Sender: TObject);
begin
  if ((wNum_Controle = '') and (MePeso.Text <> '') and (MeVolumes.Text <> '')) then
    BitBtn1Click(Self);
end;

end.
