unit UBaixaEstoqueLeitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, variants;

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
    procedure MEEmbarqueExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  
   // procedure EdSerieExit(Sender: TObject);
    procedure MENum_NotaExit(Sender: TObject);
    procedure MENum_NotaEnter(Sender: TObject);
    procedure SBProdEmbarcadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FBaixaEstoqueLeitor: TFBaixaEstoqueLeitor;
  Wnum_controle, wNum_Volume: string;

implementation

uses UEmbarque_cl, UOracle_cl, UEstoque_cl, URBaixaEstoqueLeitor,
  UrEmbarquePedido, UNotaSaida_cl, UEmbarqueParam, URProdutoEmbarcado2;

{$R *.DFM}

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
var  wAux : String;
     wCont, wCont1 : Integer;
     wCont2, wVol : Real;
begin
  wCont1 := 0;
  if (Trim(MeEmbarque.Text) = '') or (trim(MeNum_Nota.Text) = '')then
    Raise Exception.Create('Informe o Embarque e o Número da Nota Fiscal!');
  With DMEmbarque do
    try
      DMOracle.DBCemapa.StartTransaction;
      If ((MEProduto.Text) <> '') and ((Wnum_controle) <> '') then
      Begin
        wAux := DMOracle.BuscaNome('SELECT IND_TURNO FROM TB_ESTOQUE_PRODUCAO', 'NUM_CONTROLE = '+wNum_Controle);

        If wAux = 'N' then
        Begin
          QBaixaEstoqueLeitor.close;
          QBaixaEstoqueLeitor.SetVariable('EMBARQUE',FBaixaEstoqueLeitor.MEEmbarque.Text);
          QBaixaEstoqueLeitor.SetVariable('NUM_NOTA',FBaixaEstoqueLeitor.MENum_Nota.Text);
          QBaixaEstoqueLeitor.SetVariable('PRODUTO',FBaixaEstoqueLeitor.MEProduto.Text);
          QBaixaEstoqueLeitor.open;

          if((QBaixaEstoqueLeitorQT_PEDIDO.Value = QBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Value) and (wNum_Volume = '1')) then
          Begin
            while ((QBaixaEstoqueLeitorQT_PEDIDO.Value = QBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Value) and (wNum_Volume = '1') and (wCont < 5)) do
              QBaixaEstoqueLeitor.Next;
              inc(wCont1);
          end;
        

          If QBaixaEstoqueLeitorCOD_PEDIDO_ITEM.Text = '' Then
            Raise Exception.Create('Produto Não Pertence a Este Embarque ou Quantidade já Atendida!')
          else
            if ((QBaixaEstoqueLeitorQT_PEDIDO.Value > QBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Value) and (wNum_Volume = '1')) then
            Begin
              //função pra baixar estoque, pra aumentar o embarque e para mudar a situacao do produto para embarcado
              if QBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Text = '' then
                wCont := 1
              else
                wCont := StrToInt(QBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Text) + 1;
              DMOracle.QExecSQL.Close;
              DMOracle.QExecSQL.SQL.Clear;
              DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET QT_QUANTIDADE_AUX = ' + IntToStr(wCont));
              DMOracle.QExecSQL.SQL.Add('WHERE COD_PEDIDO_ITEM = ' + QBaixaEstoqueLeitorCod_Pedido_Item.Text);
              DMOracle.QExecSQL.ExecSQL;

              QEstoqueEmbarcado.Close;
              QEstoqueEmbarcado.Open;
              QEstoqueEmbarcado.Insert; 
              QEstoqueEmbarcadoCOD_PRODUTO.Value := StrToInt(MEProduto.Text);
              QEstoqueEmbarcadoCOD_FILIAL.Value := 1;
              QEstoqueEmbarcadoCOD_EMBARQUE.Value := StrToInt(Trim(MeEmbarque.Text));
              QEstoqueEmbarcadoQT_EMBARCADO.Value := 1;
              QEstoqueEmbarcadoNUM_CONTROLE.Value := StrToInt(WNum_Controle);
              QEstoqueEmbarcadoDT_EMBARQUE.Value := date;
              QEstoqueEmbarcado.Post;


              {If FBaixaEstoqueLeitor.MEProduto.Text <> '' THEN   //faz baixa de componentes
              Begin
                QBaixaComponente.Close;
                QBaixaComponente.SetVariable('COD_PRODUTO',FBaixaEstoqueLeitor.MEProduto.Text);
                QBaixaComponente.Open;
                While not QBaixaComponente.EOF do
                Begin
                  DMEstoque.AtualizaEstoque(-2,1,QBaixaComponenteCOD_PRODUTO.Value,310,(QBaixaComponenteQT_ITEM.Value*-1),0,0,0);
                  QBaixaComponente.Next;
                end;   }
                DMOracle.DBCemapa.Commit;
              //end;
                DMEstoque.AtualizaEstoque(-2,1,StrToInt(MEProduto.Text),18,-1,0,0,0);
            end;

              wVol := StrToFloat(DMOracle.BuscaNome('SELECT NUM_VOLUMES FROM TB_PRODUTO','COD_PRODUTO ='+ MeProduto.Text));

              if wVol < 1 then
                wCont2 := StrToFloat(QBaixaEstoqueLeitorQT_EMBALAGEM.Text) + 0.5
              else
                wCont2 := StrToFloat(QBaixaEstoqueLeitorQT_EMBALAGEM.Text) + 1;
              DMOracle.QExecSQL.Close;
              DMOracle.QExecSQL.SQL.Clear;
              DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET QT_EMBALAGEM = ' + StringReplace(FloatToStr(wCont2),',','.',[]));
              DMOracle.QExecSQL.SQL.Add('WHERE COD_PEDIDO_ITEM = ' + QBaixaEstoqueLeitorCod_Pedido_Item.Text);
              DMOracle.QExecSQL.ExecSQL;

              DMOracle.QExecSQL.Close;
              DMOracle.QExecSQL.SQL.Clear;
              DMOracle.QExecSQL.SQL.Add('UPDATE TB_ESTOQUE_PRODUCAO SET IND_TURNO = '+chr(39)+'S'+chr(39));
              DMOracle.QExecSQL.SQL.Add('WHERE NUM_CONTROLE = ' + Wnum_controle);//indica um unico produto q só pode ser embarcado 1 vez
              DMOracle.QExecSQL.ExecSQL;
              //o campo ind_turno = s indica q o produto ja foi embarcado

              DMOracle.DBCemapa.Commit;
         end
         else
           Raise Exception.Create('Este Produto Já Foi Embarcado!');

        QBaixaEstoqueLeitor.close;
        end;
        DMOracle.DBCemapa.Commit;
        showmessage('OK! Produto Embarcado!');
        MEProduto.SetFocus;
      except
        DMOracle.DBCemapa.rollback;
    Raise;
   end;
end;

procedure TFBaixaEstoqueLeitor.MEProdutoExit(Sender: TObject);
begin
  if Length(MEProduto.Text) > 6 then
  Begin
    FBaixaEstoqueLeitor.EdProduto.Text :=DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = '+Copy(MEProduto.Text,7,6));
    WNum_Controle := Copy(MEProduto.Text,1,6);
    wNum_Volume := copy(MEProduto.Text,13,1);
    MEProduto.Text := Copy(MEProduto.Text,7,6);
    BitBtn1.SetFocus;
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


{procedure TFBaixaEstoqueLeitor.EdSerieExit(Sender: TObject);
var
wCliente : string;
begin
  EdSerie.Text := UpperCase(EdSerie.Text);
  If (Trim(MeNum_Nota.Text) <> '') and (Trim(EdSerie.Text) <> '') then
  With DMNotaSaida do
   Begin
     wCliente := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_NOTA_CAB','NUM_NOTA =' +(MENUm_nota.Text)+ 'AND IND_ENTRADA_SAIDA =' +
                 chr(39)+ 'S' +chr(39) + 'AND COD_SERIE =' + chr(39) + (EdSerie.Text) + chr(39));
     wCliente := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + wCliente);
     EdNum_Nota.Text := wCliente;
   End;

end; }

procedure TFBaixaEstoqueLeitor.MENum_NotaExit(Sender: TObject);
var
wCliente : string;
wQtPedido, wQtQuantidade: Real;
begin
{  If (Trim(MeNum_Nota.Text) <> '') then
  with DMNotaSaida do
  begin
    wCliente := DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_NOTA_CAB','NUM_NOTA =' +(MENUm_nota.Text)+ 'AND IND_ENTRADA_SAIDA =' +
                 chr(39)+ 'S' +chr(39));
    wCliente := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = ' + wCliente);
    EdNum_Nota.Text := wCliente;
  end;

  if Trim(MENum_Nota.Text) <> '' then
  Begin
    DMEmbarque.QBaixaEstoqueLeitor.close;
    DMEmbarque.QBaixaEstoqueLeitor.SetVariable('EMBARQUE',FBaixaEstoqueLeitor.MEEmbarque.Text);
    DMEmbarque.QBaixaEstoqueLeitor.SetVariable('NUM_NOTA',FBaixaEstoqueLeitor.MENum_Nota.Text);
    DMEmbarque.QBaixaEstoqueLeitor.SetVariable('PRODUTO','0');
    DMEmbarque.QBaixaEstoqueLeitor.open;

    DMEmbarque.QBaixaEstoqueVerificacao.Close;
    DMEmbarque.QBaixaEstoqueVerificacao.SetVariable('EMBARQUE',FBaixaEstoqueLeitor.MEEmbarque.Text);
    DMEmbarque.QBaixaEstoqueVerificacao.SetVariable('NUM_NOTA',FBaixaEstoqueLeitor.MENum_Nota.Text);
    DMEmbarque.QBaixaEstoqueVerificacao.Open;

    wQtPedido := 0;
    wQtQuantidade := 0;

    DMEmbarque.QBaixaEstoqueVerificacao.First;
    while not DMEmbarque.QBaixaEstoqueVerificacao.Eof do
    begin
      wQtPedido := wQtPedido +  DMEmbarque.QBaixaEstoqueVerificacaoQT_PEDIDO.Value;
      wQtQuantidade := wQtQuantidade + DMEmbarque.QBaixaEstoqueVerificacaoQT_QUANTIDADE_AUX.Value;
      DMEmbarque.QBaixaEstoqueVerificacao.Next;
    end;

    If wQtPedido > wQtQuantidade then
        ShowMessage('Não foram embarcados todos os produtos da nota!');
  end;    }

  
end;

procedure TFBaixaEstoqueLeitor.MENum_NotaEnter(Sender: TObject);
begin
{  if Trim(MeNum_nota.Text) <> '' then
  Begin
    with DMEmbarque do
    Begin
      QRBaixaEstoqueLeitor.close;
      QRBaixaEstoqueLeitor.SetVariable('EMBARQUE',FBaixaEstoqueLeitor.MEEmbarque.Text);
      QRBaixaEstoqueLeitor.SetVariable('NUM_NOTA',FBaixaEstoqueLeitor.MENum_Nota.Text);
      QRBaixaEstoqueLeitor.SQL[QRBaixaEstoqueLeitor.SQL.Count-1]:='';  // elimina a última Linha da SQL
      QRBaixaEstoqueLeitor.SQL.Add('and TB_PEDIDO_ITEM.QT_PEDIDO <> TB_PEDIDO_ITEM.QT_QUANTIDADE_AUX');
      QRBaixaEstoqueLeitor.open;
      if DMEMBarque.QRBaixaEstoqueLeitor.RecordCount <> 0 then
        ShowMessage('Não Foram Embarcados Todos Produtos da Nota! Verifique!');
      QRBaixaEstoqueLeitor.SQL[QRBaixaEstoqueLeitor.SQL.Count-1]:='';  // elimina a última Linha da SQL
      QRBaixaEstoqueLeitor.SQL.Add('ORDER BY  TB_NOTA_CAB.NUM_NOTA');
    end;
  end;  }
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

end.
