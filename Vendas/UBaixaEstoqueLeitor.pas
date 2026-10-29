unit UBaixaEstoqueLeitor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Mask, variants, Grids, DBGrids, MPlayer,
  CPort, StrUtils;

type
  TFBaixaEstoqueLeitor = class(TForm)
    SpeedButton1: TSpeedButton;
    SBProdEmbarcado: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MEEmbarque: TMaskEdit;
    EdEmbarque: TEdit;
    EdProduto: TEdit;
    MEProduto: TMaskEdit;
    MENum_Nota: TMaskEdit;
    EdNum_Nota: TEdit;
    mpAlerta: TMediaPlayer;
    DBGPedido: TDBGrid;
    BtConfirmar: TBitBtn;
    BtCancelar: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    MeQtPedido: TMaskEdit;
    Panel2: TPanel;
    Label9: TLabel;
    MeEmbarcado: TMaskEdit;
    Panel3: TPanel;
    Label8: TLabel;
    MeVolumes: TMaskEdit;
    Panel4: TPanel;
    Label7: TLabel;
    MePeso: TMaskEdit;
    CpLeitor: TComPort;
    BtnDestravar: TBitBtn;
    LTotalEmbarcado: TLabel;
    RGCargaConfMotorista: TRadioGroup;
    procedure MEEmbarqueExit(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure MEProdutoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

   // procedure EdSerieExit(Sender: TObject);
    procedure MENum_NotaExit(Sender: TObject);
    procedure SBProdEmbarcadoClick(Sender: TObject);
    procedure MEProdutoChange(Sender: TObject);
    procedure MeVolumesExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure MEProdutoEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CpLeitorRxChar(Sender: TObject; Count: Integer);
    procedure BtnDestravarClick(Sender: TObject);
  private
    wCodBarras: string;
    wTotalPeso: Extended; //Total peso bruto do embarque
    procedure BloqueiaLeitura;
    procedure LiberaLeitura;
  public
  end;

var
  FBaixaEstoqueLeitor: TFBaixaEstoqueLeitor;
  Wnum_controle, wPeso: string;
  wContRegistro: Integer = 0;

implementation

uses UEmbarque_cl, UOracle_cl, UEstoque_cl, URBaixaEstoqueLeitor,
  UrEmbarquePedido, UNotaSaida_cl, UEmbarqueParam, URProdutoEmbarcado2,
  UBaixaSemEMbarque, UMsgPersonalizadaEmbarque, UPedido_cl, UBiblioteca,
  UProduto_cl;

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
  for I := 1 to Length(Sstring) do
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
  if Trim(MEEmbarque.Text) <> '' then
    with DMEmbarque do
    begin
      QEmbarque.Close;
      QEmbarque.SetVariable('PK', Trim(MeEmbarque.Text));
      QEmbarque.Open;
      EdEmbarque.Text := QEmbarqueNome_Motorista.Value + ' = ' + QEmbarqueDt_Embarque.Text;
      QEmbarque.Close;
      //MEProduto.SetFocus;
      wTotalPeso := StrToFloat('0' + DMOracle.FastSelect('SUM(EB.QT_PESO_EMBARCADO + NVL(P.NUM_EMBALAGEM,0))',
                              'TB_ESTOQUE_EMBARCADO EB, TB_PRODUTO P',
                              'EB.COD_PRODUTO = P.COD_PRODUTO AND EB.COD_EMBARQUE = ' + Trim(MEEmbarque.Text)));
    end;
  LTotalEmbarcado.Caption := 'Total do Embarque: ' + FloatToStr(wTotalPeso) + ' KG';
end;

procedure TFBaixaEstoqueLeitor.BtConfirmarClick(Sender: TObject);
var
  wAux, wCont1, wConfPeso: string;
begin
  try
    wConfPeso := DMOracle.BuscaNome('SELECT NUM_PESO_LIQUIDO FROM TB_PESAGEM_PRODUCAO', 'COD_PESAGEM=' + wNum_Controle);
    if Length(wCOnfPeso) = 4 then
      wConfPeso := wConfPeso + '0';
    if Length(wCOnfPeso) = 2 then
      wConfPeso := wConfPeso + ',00';

    if (Trim(MeEmbarque.Text) = '') or (trim(MeNum_Nota.Text) = '') then
    begin
      FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Embarque e Pedido não informados';
      BloqueiaLeitura;
      FMsgPersonalizadaEmbarque.ShowModal();
      LiberaLeitura;
      exit;
    end;

    with DMEmbarque do
    try
      DMOracle.DBCemapa.StartTransaction;
      if ((MEProduto.Text) <> '') and ((wNum_controle) <> '') then
      begin
        with DMProduto do
          if QProdutoCOD_PRODUTO.Text <> Trim(MEProduto.Text) then
          begin
            QProduto.Close;
            QProduto.SetVariable('PK', MEProduto.Text);
            QProduto.Open;
          end;
        wAux := DMOracle.BuscaNome('SELECT IND_SITUACAO FROM TB_PESAGEM_PRODUCAO', 'COD_PESAGEM = ' + wNum_Controle);
        wCont1 := copy(wPeso, 1, 2) + ',' + copy(wPeso, 3, 2);
        if wCont1 <> wConfPeso then
        begin
          FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Peso diferente do registrado';
          BloqueiaLeitura;
          FMsgPersonalizadaEmbarque.ShowModal();
          LiberaLeitura;
          exit;
        end;
        if (wAux = 'CANCELADA') then
        begin
          MEProduto.Text := '';
          FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Etiqueta Cancelada';
          BloqueiaLeitura;
          FMsgPersonalizadaEmbarque.ShowModal();
          LiberaLeitura;
//          lbContador.Caption := intToStr(strToInt(lbContador.Caption) - 1);
          exit;
        end;
        if (wAux = 'EMBARCADO') then
        begin
          MEProduto.Text := '';
          FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Produto já foi Embarcado';
          BloqueiaLeitura;
          FMsgPersonalizadaEmbarque.ShowModal();
          LiberaLeitura;
//          lbContador.Caption := intToStr(strToInt(lbContador.Caption) - 1);
          exit;
        end;
        if wAux = 'CONFIRMADO' then
        begin
          QBaixaEstoqueLeitor.Close;
          QBaixaEstoqueLeitor.SetVariable('EMBARQUE', Trim(MEEmbarque.Text));
          QBaixaEstoqueLeitor.SetVariable('COD_PEDIDO', Trim(MENum_Nota.Text));
          QBaixaEstoqueLeitor.SetVariable('PRODUTO', Trim(MEProduto.Text));
          QBaixaEstoqueLeitor.Open;
          MeQtPedido.Text := QBaixaEstoqueLeitorQT_PEDIDO.Text;
          MePeso.Text := wCont1;

          if Trim(QBaixaEstoqueLeitorCOD_PEDIDO_ITEM.Text) <> '' then
          begin
            //Execução de SQLs em lote
            Executador.Limpa;
            Executador.Adiciona('UPDATE TB_PEDIDO_ITEM SET QT_QUANTIDADE_AUX = ' +
              'NVL(QT_QUANTIDADE_AUX,0) + ' + QuotedStr(wCont1) +
              ',QT_EMBALAGEM = NVL(QT_EMBALAGEM,0) + 1' +
              ' WHERE COD_PEDIDO_ITEM = ' + QBaixaEstoqueLeitorCOD_PEDIDO_ITEM.Text);
            Executador.Adiciona('UPDATE TB_PESAGEM_PRODUCAO SET IND_SITUACAO = ' + QuotedStr('EMBARCADO') +
              ' WHERE COD_PESAGEM = ' + wNum_Controle);
            Executador.Adiciona('INSERT INTO TB_ESTOQUE_EMBARCADO(COD_ESTOQUE_EMBARCADO,COD_PRODUTO,COD_FILIAL,' +
              'COD_EMBARQUE,QT_EMBARCADO,QT_PESO_EMBARCADO,NUM_CONTROLE,DT_EMBARQUE, ' +
              'COD_PEDIDO_CAB) VALUES(SQESTOQUE_EMBARCADO.NEXTVAL,' +
              Trim(MEProduto.Text) + ',2,' + Trim(MeEmbarque.Text) +
              ',1,' + QuotedStr(wCont1) + ',' + wNum_Controle + ',' +
              QuotedStr(DateToStr(DATE)) + ',' + MENum_Nota.Text + ')'); 
            Executador.Executar(True, False); //Executando tudo de uma vez

  {          DMOracle.QExecSQL.Close;  //Adicionado a execucao em lotes
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET QT_QUANTIDADE_AUX = ' + CHR(39) + FloatToStr(QBaixaEstoqueLeitorQT_QUANTIDADE_AUX.Value + StrToFloat(wCont1)) + CHR(39));
            DMOracle.QExecSQL.SQL.Add(',QT_EMBALAGEM = ' + CHR(39) + FloatToStr(QBaixaEstoqueLeitorQT_EMBALAGEM.Value + 1) + CHR(39));
            DMOracle.QExecSQL.SQL.Add('WHERE COD_PEDIDO_ITEM = ' + QBaixaEstoqueLeitorCod_Pedido_Item.Text);
            DMOracle.QExecSQL.ExecSQL;}
              //DMOracle.DBCemapa.Commit;

  {          DMOracle.QExecSQL.Close;  // retirado esta sql pelo César e colocado a atualizacao na sql anterior
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_PEDIDO_ITEM SET QT_EMBALAGEM = ' + CHR(39) + FloatToStr(QBaixaEstoqueLeitorQT_EMBALAGEM.Value + 1) + CHR(39));
            DMOracle.QExecSQL.SQL.Add('WHERE COD_PEDIDO_ITEM = ' + QBaixaEstoqueLeitorCod_Pedido_Item.Text);
            DMOracle.QExecSQL.ExecSQL;
              //DMOracle.DBCemapa.Commit;
  }
            {DMOracle.QExecSQL.Close;  //Adicionado a execucao em lotes
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('UPDATE TB_PESAGEM_PRODUCAO SET IND_SITUACAO = ' + CHR(39) + 'EMBARCADO' + CHR(39));
            DMOracle.QExecSQL.SQL.Add('WHERE COD_PESAGEM = ' + wNum_Controle);
            DMOracle.QExecSQL.ExecSQL;}
              //DMOracle.DBCemapa.Commit;

  //          wSeq := DMOracle.BuscaNome('SELECT SQESTOQUE_EMBARCADO.NEXTVAL FROM DUAL', '1=1');
            {DMOracle.QExecSQL.Close;  //Adicionado a execucao em lotes
            DMOracle.QExecSQL.SQL.Clear;
            DMOracle.QExecSQL.SQL.Add('INSERT INTO TB_ESTOQUE_EMBARCADO(COD_ESTOQUE_EMBARCADO,COD_PRODUTO,COD_FILIAL,');
            DMOracle.QExecSQL.SQL.Add('COD_EMBARQUE,QT_EMBARCADO,QT_PESO_EMBARCADO,NUM_CONTROLE,DT_EMBARQUE,         ');
            DMOracle.QExecSQL.SQL.Add('COD_PEDIDO_CAB) VALUES(SQESTOQUE_EMBARCADO.NEXTVAL,' + Trim(MEProduto.Text) + ',2,');
            DMOracle.QExecSQL.SQL.Add(Trim(MeEmbarque.Text) + ',1,' + chr(39) + wCont1 + chr(39) + ',' + wNum_Controle + ',');
            DMOracle.QExecSQL.SQL.Add(chr(39) + DateToStr(DATE) + chr(39) + ',' + MENum_Nota.Text + ')');
            DMOracle.QExecSQL.ExecSQL;}

            MeVolumes.Text := FloatToStr(StrToInt(QBaixaEstoqueLeitorQT_EMBALAGEM.Text) + 1);

            wTotalPeso := wTotalPeso + StrToFloat(wCont1) + DMProduto.QProdutoNUM_EMBALAGEM.Value;
            //Atualizacao de estoque via trigger
          end
          else
          begin
            FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Produto não pertence ao Embarque.';
            BloqueiaLeitura;
            FMsgPersonalizadaEmbarque.ShowModal();
            LiberaLeitura;
//            lbContador.Caption := intToStr(strToInt(lbContador.Caption) - 1);
            Exit;
          end
        end;
      end;

      QRBaixaEstoqueLeitor.Close;
      QRBaixaEstoqueLeitor.SetVariable('EMBARQUE', MeEmbarque.Text);
      QRBaixaEstoqueLeitor.SetVariable('COD_PEDIDO', MeNum_Nota.Text);
      QRBaixaEstoqueLeitor.open;

      QBaixaEstoqueLeitor.close;

      DMOracle.DBCemapa.Commit;
    except
      on e: Exception do
      begin
        DMOracle.DBCemapa.rollback;
        FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Erro!' + #13 + #10 + e.Message;
        BloqueiaLeitura;
        FMsgPersonalizadaEmbarque.ShowModal();
        LiberaLeitura;
        exit;
      end;
    end;

    Buscador.Limpa;
    Buscador.Adiciona('QT_QUANTIDADE_AUX', 'TB_PEDIDO_ITEM', 'COD_PEDIDO_CAB=' +
             Trim(MeNum_Nota.Text) + ' AND COD_PRODUTO =' + Trim(MeProduto.Text) + ' AND ROWNUM = 1'); //Rownum limita em 1 registro o retorno
    Buscador.Adiciona('QT_PEDIDO', 'TB_PEDIDO_ITEM', 'COD_PEDIDO_CAB=' +
             Trim(MeNum_Nota.Text) + ' and COD_PRODUTO =' + Trim(MeProduto.Text) + ' AND ROWNUM = 1'); //Rownum limita em 1 registro o retorno
    Buscador.Adiciona('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO =' + Trim(MeProduto.Text));
    Buscador.Buscar();
    MeEmbarcado.Text := Buscador.Proximo;
    MeQtPedido.Text :=  Buscador.Proximo;
    EdProduto.Text := Buscador.Proximo;
    LTotalEmbarcado.Caption := 'Total do Embarque: ' + FloatToStr(wTotalPeso) + ' KG';

    inc(wContRegistro);
    MeProduto.Text := '';
    MEProduto.SetFocus;
    if (wContRegistro = 100) then
    begin
      try
        wContRegistro := 0;
        DMOracle.DBCemapa.Connected := false;
        DMOracle.DBCemapa.Connected := true;
      except
        showMessage('Erro na atualização de cursores, o programa será terminado');
        Application.Terminate;
      end;
    end;
  except
    //Se der exceçao, nao tratar e nem exibir para o usuario. Se não deu certo para atualizar,
    //o sistema já avisa o usuario e trava o leitor automaticamente.
  end;
end;

procedure TFBaixaEstoqueLeitor.MEProdutoExit(Sender: TObject);
var
  wProduto: string;
begin
  if ((Trim(MEProduto.Text) <> '') and (Length(MeProduto.Text) = 14)) then
  begin
    FBaixaEstoqueLeitor.EdProduto.Text := DMOracle.BuscaNome('SELECT DESC_PRODUTO FROM TB_PRODUTO', 'COD_PRODUTO = ' + Copy(MEProduto.Text, 8, 3));
    wNum_Controle := Copy(MEProduto.Text, 1, 7);
    wPeso := copy(MEProduto.Text, 11, 4);
    MeProduto.Text := Copy(MeProduto.Text, 8, 3);
    wProduto := DMOracle.BuscaNome('SELECT COD_PRODUTO FROM TB_PESAGEM_PRODUCAO', 'COD_PESAGEM =' + wNum_COntrole);

    if wProduto = '' then
    begin
      FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Produto ' + meProduto.Text + ' não identificado! Tente novamente';
      BloqueiaLeitura;
      FMsgPersonalizadaEmbarque.ShowModal();
      LiberaLeitura;
      exit;
    end;

    BtConfirmarClick(Self);
  end;
end;

procedure TFBaixaEstoqueLeitor.SpeedButton1Click(Sender: TObject);
begin
  if (Trim(MEEmbarque.Text) = '') then
    raise Exception.Create('Informe o Embarque!');
  with DMEmbarque do
  begin
    QRBaixaEstoqueLeitor.Close;
    QRBaixaEstoqueLeitor.SetVariable('EMBARQUE', Trim(MeEmbarque.Text));
      //if Trim(MeNum_Nota.Text) = '' then
      //  QRBaixaEstoqueLeitor.SetVariable('NUM_NOTA',NULL)
     // Else
      //  QRBaixaEstoqueLeitor.SetVariable('NUM_NOTA',Trim(MENum_Nota.Text));
    QRBaixaEstoqueLeitor.Open;
    if FrBaixaEstoqueLeitor = nil then
      FrBaixaEstoqueLeitor := TFrBaixaEstoqueLeitor.Create(Application);
    FrBaixaEstoqueLeitor.QRLEmbarque.Caption := 'Embarque: ' + (MEEmbarque.Text) + 'Motorista: ' + (EdEmbarque.Text);
    FrBaixaEstoqueLeitor.QRPrimario.Preview;
    QRBaixaEstoqueLeitor.Close;
  end;
end;

procedure TFBaixaEstoqueLeitor.MENum_NotaExit(Sender: TObject);
var
  wEmbarque: integer;
  wCadastro: integer;
begin
  if ((Trim(MeEmbarque.Text) <> '') and (Trim(MENum_Nota.Text) <> '')) then
  begin
    wEmbarque := StrToInt(DMOracle.BuscaNome('SELECT COD_EMBARQUE FROM TB_EMBARQUE_ITEM ', 'COD_PEDIDO_CAB =' + MeNum_nota.Text));
    wCadastro := StrToInt(DMOracle.BuscaNome('SELECT COD_CADASTRO FROM TB_PEDIDO_CAB', 'COD_PEDIDO_CAB =' + MeNum_Nota.Text));
    if IntToStr(wEmbarque) <> Trim(MEEmbarque.Text) then
      raise Exception.Create('Pedido não pertence a este embarque!')
    else
    begin
      DMEmbarque.QRBaixaEstoqueLeitor.Close;
      DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('EMBARQUE', MeEmbarque.Text);
      DMEmbarque.QRBaixaEstoqueLeitor.SetVariable('COD_PEDIDO', MeNum_Nota.Text);
      DMEmbarque.QRBaixaEstoqueLeitor.open;
      EdNum_Nota.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO', 'COD_CADASTRO =' + IntToStr(wCadastro));
      MeProduto.SetFocus;
    end;
  end;
end;

procedure TFBaixaEstoqueLeitor.SBProdEmbarcadoClick(Sender: TObject);
begin
  if FEmbarqueParam = nil then
    FEmbarqueParam := TFEmbarqueParam.Create(Application);
  FEmbarqueParam.PGRelatorio.Pages[13].TabVisible := True;
  if FEmbarqueParam.ShowModal = mrOk then
    with DMEmbarque do
    begin
      QRProdutoEmbarcado2.Close;
      if (FEmbarqueParam.Me14DtInicial.Text = '') or (FEmbarqueParam.Me14DtFinal.Text = '') then
      begin
        QRProdutoEmbarcado2.SetVariable('DT_INICIAL', Null);
        QRProdutoEmbarcado2.SetVariable('DT_FINAL', Null);
      end
      else
      begin
        QRProdutoEmbarcado2.SetVariable('DT_INICIAL', trim(FEmbarqueParam.Me14DtInicial.Text));
        QRProdutoEmbarcado2.SetVariable('DT_FINAL', trim(FEmbarqueParam.Me14DtFinal.Text));
      end;

      if Trim(FEmbarqueParam.Me14Embarque.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('EMBARQUE', Null)
      else
        QRProdutoEmbarcado2.SetVariable('EMBARQUE', trim(FEmbarqueParam.Me14Embarque.Text));

      if Trim(FEmbarqueParam.Me14Pedido.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('PEDIDO', Null)
      else
        QRProdutoEmbarcado2.SetVariable('PEDIDO', trim(FEmbarqueParam.Me14Pedido.Text));

      if Trim(FEmbarqueParam.Fm14Produto.MeProduto.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('PRODUTO', Null)
      else
        QRProdutoEmbarcado2.SetVariable('PRODUTO', trim(FEmbarqueParam.Fm14Produto.MeProduto.Text));

      if (Trim(FEmbarqueParam.Me14Classe.Text) = '') then
        QRProdutoEmbarcado2.SetVariable('CLASSE', Null)
      else
        QRProdutoEmbarcado2.SetVariable('CLASSE', trim(FEmbarqueParam.Me14Classe.Text));

      if trim(FEmbarqueParam.FmCadastro14.MeCadastro.Text) = '' then
        QRProdutoEmbarcado2.SetVariable('COD_CADASTRO', null)
      else
        QRProdutoEmbarcado2.SetVariable('COD_CADASTRO', trim(FEmbarqueParam.FmCadastro14.MeCadastro.Text));

   // if trim(FEmbarqueParam.meEtiqueta14.Text) = '' then
   //   QRProdutoEmbarcado2.SetVariable('NUM_CONTROLE', null)
   // else
   //   QRProdutoEmbarcado2.SetVariable('NUM_CONTROLE', trim(FEmbarqueParam.meEtiqueta14.Text));

      QRProdutoEmbarcado2.Open;
      if FrProdutoEmbarcado2 = nil then
        FrProdutoEmbarcado2 := TFrProdutoEmbarcado2.Create(Application);
      FrProdutoEmbarcado2.QRLPeriodo.Caption := 'Período: ' + FEmbarqueParam.ME14DtInicial.text + ' até ' + FEmbarqueParam.ME14DtFinal.Text +
        'Embarque: ' + FEmbarqueParam.ME14Embarque.Text + ' Classe: ' + FEmbarqueParam.ME14Classe.Text;
      if FEmbarqueParam.RGPreview.ItemIndex = 0 then
        FrProdutoEmbarcado2.QRPrimario.Preview
      else
        FrProdutoEmbarcado2.QRPrimario.Print;
      QRProdutoEmbarcado2.Close;
    end;
end;

procedure TFBaixaEstoqueLeitor.MEProdutoChange(Sender: TObject);
begin
//  if length(MEProduto.Text) = 4 then
//    lbContador.Caption := intToStr(strToInt(lbContador.Caption) + 1);
  if (MEProduto.Text <> '') then
  begin
    if Length(MEProduto.Text) > 14 then
    begin
      MEProduto.Text := '';
      FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Produto não Embarcado!';
      BloqueiaLeitura;
      FMsgPersonalizadaEmbarque.ShowModal();
      LiberaLeitura;
    end;
    if Length(MEProduto.Text) = 14 then
      MeProdutoExit(Self);
  end;
end;

procedure TFBaixaEstoqueLeitor.MeVolumesExit(Sender: TObject);
begin
  if ((wNum_Controle = '') and (MePeso.Text <> '') and (MeVolumes.Text <> '')) then
    BtConfirmarClick(Self);
end;

procedure TFBaixaEstoqueLeitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DMOracle.DBCemapa.Commit;
  if CpLeitor.Connected then
    CpLeitor.Connected := False;
end;

procedure TFBaixaEstoqueLeitor.FormActivate(Sender: TObject);
begin
  MEProduto.SetFocus;

  try
    CpLeitor.Connected := False;
    CpLeitor.Connected := True;
    BtnDestravar.Visible := True;
  except
    BtnDestravar.Visible := False;
  end;
end;

procedure TFBaixaEstoqueLeitor.MEProdutoEnter(Sender: TObject);
begin
  MEProduto.SelectAll;
end;

procedure TFBaixaEstoqueLeitor.FormCreate(Sender: TObject);
begin
  wTotalPeso := 0;
  if (Bib.GetWindowsVersion = SO_UNKNOWN) then //Windows 7 corta muito as bordas
  begin
    LTotalEmbarcado.Left := LTotalEmbarcado.Left + 16;
    DBGPedido.Left := DBGPedido.Left + 16;
    BtnDestravar.Left := BtnDestravar.Left - 100;

    DBGPedido.Width := DBGPedido.Width - 120;
    DBGPedido.Height := DBGPedido.Height - 140;

    LTotalEmbarcado.Top := LTotalEmbarcado.Top - 140;
    BtConfirmar.Top := BtConfirmar.Top - 140;
    BtCancelar.Top := BtCancelar.Top - 140;
    BtnDestravar.Top := BtnDestravar.Top - 140;
  end;
  if FMsgPersonalizadaEmbarque = nil then
    FMsgPersonalizadaEmbarque := TFMsgPersonalizadaEmbarque.Create(Application);
end;

procedure TFBaixaEstoqueLeitor.CpLeitorRxChar(Sender: TObject;
  Count: Integer);
var
  wCodBarrasTemp: string;
  wPeso: Extended;
//  wTamanhoCodBarras: Integer;
begin
//  try
//  begin
  CpLeitor.ReadStr(wCodBarrasTemp, Count);
//  if (wCodBarrasTemp = #6) then
  if (PosEx(#6, wCodBarrasTemp) > 0) and (Length(wCodBarras + wCodBarrasTemp) < 14) then
  begin
    wCodBarras := '';
    wCodBarrasTemp := '';
    CpLeitor.ClearBuffer(True, True);
  end;

  wCodBarras := wCodBarras + wCodBarrasTemp;
  if Length(wCodBarras) >= 14 then
  begin
    wPeso := wTotalPeso;
    FMsgPersonalizadaEmbarque.Exibido := False;
    MEProduto.Text := copy(Bib.LimpaNumero(wCodBarras), 1, 14);
    wCodBarras := '';
    wCodBarrasTemp := '';
    CpLeitor.ClearBuffer(True, True);
    MEProdutoExit(Self);
    if (not FMsgPersonalizadaEmbarque.Exibido) and (wPeso = wTotalPeso) then //Se não houve alteração de peso, não houve leitura do produto
    begin
      FMsgPersonalizadaEmbarque.lbMensagem.Caption := 'Parece que não foi registrado o produto. Por favor, passe o leitor novamente ou digite.';
      BloqueiaLeitura;
      FMsgPersonalizadaEmbarque.ShowModal;
      LiberaLeitura;
      FMsgPersonalizadaEmbarque.Exibido := False;
    end;
  end;
//  end
//  except
//    wCodBarras := '';
//    wCodBarrasTemp := '';
//    CpLeitor.ClearBuffer(True, True);
//  end;
end;

procedure TFBaixaEstoqueLeitor.BloqueiaLeitura;
begin
  if CpLeitor.Connected then
  begin
    CpLeitor.ClearBuffer(True, True);
    Sleep(10);
    CpLeitor.WriteStr(#2 + '999999' + #3);
    Sleep(10);
    CpLeitor.WriteStr(#2 + '100103' + #3);
    Sleep(10);
    CpLeitor.WriteStr(#2 + '999999' + #3);
    Sleep(10);
    CpLeitor.ClearBuffer(True, True);
  end;
end;

procedure TFBaixaEstoqueLeitor.LiberaLeitura;
begin
  if CpLeitor.Connected then
  begin
    CpLeitor.ClearBuffer(True, True);
    Sleep(10);
    CpLeitor.WriteStr(#2 + '999999' + #3);
    Sleep(10);
    CpLeitor.WriteStr(#2 + '100113' + #3);
    Sleep(10);
    CpLeitor.WriteStr(#2 + '999999' + #3);
    Sleep(10);
    CpLeitor.ClearBuffer(True, True);
  end;
end;

procedure TFBaixaEstoqueLeitor.BtnDestravarClick(Sender: TObject);
begin
  LiberaLeitura;
end;

end.
